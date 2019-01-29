defmodule Engine.Content do
  import Ecto.Query

  alias Engine.{Repo, Content}

  def list_posts(author, %{date: date}) do
    from(t in Content.Post,
      where: t.author_id == ^author.id,
      where: fragment("date_trunc('day', ?)", t.published_at) == type(^date, :date)
    )
    |> Repo.all()
  end

  def list_posts(%Engine.Accounts.User{} = author, args, _resolution) do
    {:ok, Engine.Content.list_posts(author, args)}
  end

  def list_posts(_parent, _args, _resolution) do
    {:ok, Engine.Content.list_posts()}
  end

  # def list_posts(author, _) do
  #   from(t in Content.Post, where: t.author_id == ^author.id)
  #   |> Repo.all()
  # end

  # def list_posts do
  #   Repo.all(Content.Post)
  # end

  def create_post(_parent, args, %{context: %{current_user: user}}) do
    Engine.Content.create_post(user, args)
  end

  def create_post(_parent, _args, _resolution) do
    {:error, "Access denied"}
  end
end
