defmodule EngineWeb.Schema do
  use Absinthe.Schema

  import_types(__MODULE__.ContentTypes)

  alias EngineWeb.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Content.list_posts/3)
    end
  end
end
