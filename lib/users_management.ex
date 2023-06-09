defmodule UsersManagement do
  alias UsersManagement.Users.Create, as: UserCreate
  alias UsersManagement.Users.Delete, as: UserDelete
  alias UsersManagement.Users.Get, as: UserGet
  alias UsersManagement.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate get_all_users(), to: UserGet, as: :all
  defdelegate update_user(params), to: UserUpdate, as: :call
end
