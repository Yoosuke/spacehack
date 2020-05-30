defmodule Spacehack.Repo do
  use Ecto.Repo,
    otp_app: :spacehack,
    adapter: Ecto.Adapters.Postgres
end
