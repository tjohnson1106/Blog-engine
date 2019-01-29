defmodule EngineWeb.Schema do
  use Absinthe.Schema

  import_types(__MODULE__.ContentTypes)
  import_types(__MODULE__.AccountTypes)

  alias EngineWeb.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Content.list_posts/3)
    end

    @desc "get user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end
  end
end
