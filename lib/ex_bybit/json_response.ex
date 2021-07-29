defmodule ExBybit.JsonResponse do
  @type error :: String.t()
  @type result :: map
  @type t :: %__MODULE__{
          ext_code: String.t(),
          ext_info: String.t() | nil,
          rate_limit_status: non_neg_integer,
          rate_limit_reset_ms: non_neg_integer,
          rate_limit: non_neg_integer,
          ret_code: non_neg_integer,
          ret_msg: String.t(),
          result: result,
          time_now: String.t()
        }

  defstruct ~w[
    ext_code
    ext_info
    rate_limit_status
    rate_limit_reset_ms
    rate_limit
    ret_code
    ret_msg
    result
    time_now
  ]a
end
