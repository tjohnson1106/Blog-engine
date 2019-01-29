defmodule Engine.Accounts do
  alias Engine.{Accounts, Repo}

  def find_user(id) do
    Repo.get(Accounts.User, id)
  end

  def create_user(_parent, args, %{context: %{current_user: %{admin: true}}}) do
    Engine.Accounts.create_user(args)
  end

  def create_user(_parent, args, _resolution) do
    {:error, "Access denied"}
  end

  # def create_user(attrs) do
  #   {contact_attrs, user_attrs} = Map.pop(attrs, :contact)

  #   Repo.transaction(fn ->
  #     with {:ok, contact} <- create_contact(contact_attrs),
  #          {:ok, user} <- do_create_user(user_attrs, contact) do
  #       %{user | contacts: [contact]}
  #     end
  #   end)
  # end

  def create_contact(attrs) do
    attrs
    |> Accounts.Contact.changeset()
    |> Engine.Repo.insert()
  end

  defp do_create_user(attrs, contact) do
    attrs
    |> Map.put(:contact_id, contact.id)
    |> Accounts.User.changeset()
    |> Engine.Repo.insert()
  end
end
