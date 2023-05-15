defmodule UsersManagement.Repo do
  use Ecto.Repo,
    otp_app: :users_management,
    adapter: Ecto.Adapters.Postgres
end
