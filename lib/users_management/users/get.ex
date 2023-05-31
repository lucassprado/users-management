defmodule UsersManagement.Users.Get do
  alias Ecto.UUID
  alias UsersManagement.{Error, Repo, User}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> get(uuid)
    end
  end

  def all() do
    case Repo.all(User) do
      nil -> {:error, Error.build_user_not_found_error()}
      users -> {:ok, users}
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
