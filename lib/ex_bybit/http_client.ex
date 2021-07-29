defmodule ExBybit.HTTPClient do
  @type verb :: :get | :post | :put | :delete
  @type params :: map
  @type path :: String.t()
  @type uri :: String.t()
  @type credentials :: ExBybit.Credentials.t()
  @type error_reason :: Maptu.Extension.non_strict_error_reason() | HTTPoison.Error.t()
  @type non_auth_response :: {:ok, ExBybit.JsonResponse.t()} | {:error, error_reason}
  @type auth_response :: {:ok, ExBybit.JsonResponse.t()} | {:error, error_reason}

  @spec domain :: String.t()
  def domain, do: Application.get_env(:ex_bybit, :domain, "api.bybit.com")

  @spec protocol :: String.t()
  def protocol, do: Application.get_env(:ex_bybit, :protocol, "https://")

  @spec origin :: String.t()
  def origin, do: protocol() <> domain()

  @spec url(uri) :: String.t()
  def url(uri), do: origin() <> uri

  @spec api_path :: String.t()
  def api_path, do: Application.get_env(:ex_bybit, :api_path, "")

  @spec non_auth_get(path, params) :: non_auth_response
  def non_auth_get(path, params \\ %{}) do
    non_auth_request(:get, path |> to_uri(params))
  end

  @spec non_auth_request(verb, uri) :: non_auth_response
  def non_auth_request(verb, uri) do
    headers = [] |> put_content_type(:json)

    %HTTPoison.Request{
      method: verb,
      url: url(uri),
      headers: headers
    }
    |> send
  end

  @spec auth_get(path, credentials, params) :: auth_response
  def auth_get(path, credentials, params) do
    auth_request(:get, path |> to_uri(params), credentials, "")
  end

  @spec auth_post(path, credentials, params) :: auth_response
  def auth_post(path, credentials, params) do
    uri = path |> to_uri(%{})
    body = Jason.encode!(params)
    auth_request(:post, uri, credentials, body)
  end

  @spec auth_delete(path, credentials, params) :: auth_response
  def auth_delete(path, credentials, params \\ %{}) do
    uri = path |> to_uri(%{})
    body = Jason.encode!(params)
    auth_request(:delete, uri, credentials, body)
  end

  @spec auth_request(verb, uri, credentials, term) :: auth_response
  def auth_request(verb, uri, _credentials, body) do
    headers = [] |> put_content_type(:json)

    %HTTPoison.Request{
      method: verb,
      url: url(uri),
      headers: headers,
      body: body
    }
    |> send
  end

  defp to_uri(path, params) do
    %URI{
      path: api_path() <> path,
      query: URI.encode_query(params)
    }
    |> URI.to_string()
    |> String.trim("?")
  end

  defp put_content_type(headers, :json) do
    Keyword.put(headers, :"Content-Type", "application/json")
  end

  defp send(request) do
    request
    |> HTTPoison.request()
    |> parse_response
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body}}) do
    {:ok, json} = Jason.decode(body)
    Mapail.map_to_struct(json, ExBybit.JsonResponse, transformations: [:snake_case])
  end

  defp parse_response({:error, _} = result) do
    result
  end
end
