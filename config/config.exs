import Config

if config_env() == :test do
  config :ex_bybit, domain: "api-testnet.bybit.com"
end
