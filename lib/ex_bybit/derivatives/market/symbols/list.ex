defmodule ExBybit.Derivatives.Market.Symbols.List do
  alias ExBybit.Derivatives.Symbol.{LeverageFilter, PriceFilter, LotSizeFilter}
  alias ExBybit.Derivatives.Symbol

  @type symbol :: Symbol.t()
  @type result :: {:ok, [symbol]} | {:error, :parse_result_item}

  @spec get :: result
  def get do
    "/v2/public/symbols"
    |> ExBybit.HTTPClient.non_auth_get(%{})
    |> parse_response()
  end

  defp parse_response({:ok, %ExBybit.JsonResponse{result: symbols}}) do
    symbols
    |> Enum.map(fn raw_symbol ->
      case map_to_struct(raw_symbol, Symbol) do
        {:ok, symbol} -> embed_map_to_struct(symbol)
        {:error, _} = error -> error
      end
    end)
    |> Enum.reduce(
      {:ok, []},
      fn
        {:ok, i}, {:ok, acc} -> {:ok, [i | acc]}
        _, _acc -> {:error, :parse_result_item}
      end
    )
  end

  defp map_to_struct(map, mod) do
    Mapail.map_to_struct(map, mod)
  end

  defp embed_map_to_struct(symbol) do
    symbol
    |> (fn s ->
          case map_to_struct(s.leverage_filter, LeverageFilter) do
            {:ok, f} -> {:ok, %{s | leverage_filter: f}}
            {:error, _} = error -> error
          end
        end).()
    |> (fn
          {:ok, s} ->
            case map_to_struct(s.price_filter, PriceFilter) do
              {:ok, f} -> {:ok, %{s | price_filter: f}}
              {:error, _} = error -> error
            end

          {:error, _} = error ->
            error
        end).()
    |> (fn
          {:ok, s} ->
            case map_to_struct(s.lot_size_filter, LotSizeFilter) do
              {:ok, f} -> {:ok, %{s | lot_size_filter: f}}
              {:error, _} = error -> error
            end

          {:error, _} = error ->
            error
        end).()
  end
end
