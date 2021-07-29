defmodule ExBybit.Derivatives.Symbol do
  defmodule LeverageFilter do
    @type t :: %__MODULE__{
            leverage_step: String.t(),
            max_leverage: non_neg_integer(),
            min_leverage: non_neg_integer()
          }

    defstruct ~w[leverage_step max_leverage min_leverage]a
  end

  defmodule PriceFilter do
    @type t :: %__MODULE__{
            tick_size: String.t(),
            max_price: String.t(),
            min_price: String.t()
          }

    defstruct ~w[tick_size max_price min_price]a
  end

  defmodule LotSizeFilter do
    @type t :: %__MODULE__{
            qty_step: number,
            max_trading_qty: number,
            min_trading_qty: number
          }

    defstruct ~w[qty_step max_trading_qty min_trading_qty]a
  end

  @type t :: %__MODULE__{
          name: String.t(),
          alias: String.t(),
          status: String.t(),
          base_currency: String.t(),
          quote_currency: String.t(),
          price_scale: non_neg_integer,
          taker_fee: String.t(),
          maker_fee: String.t(),
          leverage_filter: LeverageFilter.t(),
          price_filter: PriceFilter.t(),
          lot_size_filter: LotSizeFilter.t()
        }

  defstruct ~w[
    name
    alias
    status
    base_currency
    quote_currency
    price_scale
    taker_fee
    maker_fee
    leverage_filter
    price_filter
    lot_size_filter
  ]a
end
