defmodule UsersManagementWeb.UsersView do
  use UsersManagementWeb, :view

  alias UsersManagement.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}

  def render("users.json", %{users: users}), do: %{users: users}
end
