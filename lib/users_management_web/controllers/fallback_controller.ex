defmodule UsersManagementWeb.FallbackController do
  use UsersManagementWeb, :controller

  alias UsersManagement.Error
  alias UsersManagementWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
