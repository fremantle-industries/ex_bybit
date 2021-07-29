defmodule ExBybit.Derivatives.Market.Symbols.ListTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest ExBybit.Derivatives.Market.Symbols.List

  setup_all do
    HTTPoison.start()
    :ok
  end

  test ".get/0 returns a list of symbols" do
    use_cassette "derivatives/market/symbols/list/get_ok" do
      assert {:ok, symbols} = ExBybit.Derivatives.Market.Symbols.List.get()
      assert Enum.count(symbols) > 0
      assert Enum.at(symbols, 0).base_currency != nil
      assert Enum.at(symbols, 0).leverage_filter.leverage_step != nil
      assert Enum.at(symbols, 0).price_filter.tick_size != nil
      assert Enum.at(symbols, 0).lot_size_filter.qty_step != nil
    end
  end
end
