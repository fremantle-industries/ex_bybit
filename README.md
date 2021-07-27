# ExBybit
[![Build Status](https://github.com/fremantle-capital/ex_bybit/workflows/test/badge.svg?branch=main)](https://github.com/fremantle-capital/ex_bybit/actions?query=workflow%3Atest)
[![hex.pm version](https://img.shields.io/hexpm/v/ex_bybit.svg?style=flat)](https://hex.pm/packages/ex_bybit)

Bybit API Client for Elixir

## Installation

Add the `ex_bybit` package to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_bybit, "~> 0.1.0"}
  ]
end
```

## Requirements

- Erlang 22+
- Elixir 1.10+

## API Documentation

https://bybit-exchange.github.io/docs/inverse/#t-introduction

## REST API

#### Market Data Endpoints

- [ ] `GET /v2/public/orderBook/L2`
- [ ] `GET /v2/public/kline/list`
- [ ] `GET /v2/public/tickers`
- [ ] `GET /v2/public/trading-records`
- [ ] `GET /v2/public/symbols`
- [ ] `GET /v2/public/liq-records`
- [ ] `GET /v2/public/mark-price-kline`
- [ ] `GET /v2/public/index-price-kline`
- [ ] `GET /v2/public/premium-index-kline`
- [ ] `GET /v2/public/open-interest`
- [ ] `GET /v2/public/big-deal`
- [ ] `GET /v2/public/account-ratio`

#### Account Data Endpoints

- [ ] `GET /v2/private/order/create`
- [ ] `GET /v2/private/order/list`
- [ ] `GET /v2/private/order/cancel`
- [ ] `GET /v2/private/order/cancelAll`
- [ ] `GET /v2/private/order/replace`
- [ ] `GET /v2/private/order`
- [ ] `GET /v2/private/stop-order/create`
- [ ] `GET /v2/private/stop-order/list`
- [ ] `GET /v2/private/stop-order/cancel`
- [ ] `GET /v2/private/stop-order/cancelAll`
- [ ] `GET /v2/private/stop-order/replace`
- [ ] `GET /v2/private/stop-order`
- [ ] `GET /v2/private/position/list`
- [ ] `GET /v2/private/position/change-position-margin`
- [ ] `GET /v2/private/position/trading-stop`
- [ ] `GET /v2/private/position/leverage/save`
- [ ] `GET /v2/private/execution/list`
- [ ] `GET /v2/private/trade/closed-pnl/list`
- [ ] `GET /v2/private/tpsl/switch-mode`
- [ ] `GET /v2/private/position/switch-isolated`
- [ ] `GET /v2/public/risk-limit/list`
- [ ] `POST /v2/public/risk-limit/list`
- [ ] `GET /v2/public/funding/prev-funding-rate`
- [ ] `GET /v2/private/funding/prev-funding`
- [ ] `GET /v2/private/funding/predicted-funding`
- [ ] `GET /v2/private/account/api-key`
- [ ] `GET /v2/private/account/lcp`

#### Wallet Data Endpoints

- [ ] `GET /v2/private/wallet/balance`
- [ ] `GET /v2/private/wallet/fund/records`
- [ ] `GET /v2/private/wallet/withdraw/list`
- [ ] `GET /v2/private/exchange-order/list`

#### API Data Endpoints

- [ ] `GET /v2/public/time`
- [ ] `GET /v2/public/announcement`

## Authors

* Alex Kwiatkowski - alex+git@fremantle.io

## License

`ex_bybit` is released under the [MIT license](./LICENSE)
