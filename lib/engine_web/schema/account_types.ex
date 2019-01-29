defmodule EngineWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  alias EngineWeb.Resolvers

  @desc "A blog user"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string

    field :posts, list_of(:post) do
      arg(:date, :date)
      resolve(&Resolvers.Content.list_posts/3)
    end
  end
end
