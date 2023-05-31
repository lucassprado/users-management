defmodule UsersManagementWeb.UsersController do
  use UsersManagementWeb, :controller

  alias UsersManagement.User
  alias UsersManagementWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with {:ok, users} <- UsersManagement.get_all_users() do
      conn
      |> put_status(:ok)
      |> render("users.json", users: users)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- UsersManagement.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- UsersManagement.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- UsersManagement.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- UsersManagement.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
