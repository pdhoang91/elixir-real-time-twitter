defmodule KafiWealth.Repo do
  use Ecto.Repo,
    otp_app: :kafi_wealth,
    adapter: Ecto.Adapters.Postgres
end
