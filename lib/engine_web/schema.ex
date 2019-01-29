defmodule EngineWeb.Schema do
  use Absinthe.Schema

  import_types(__MODULE__.ContentTypes)
  import_types(__MODULE__.AccountTypes)

  import_types(Absinthe.Type.Custom)

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

  mutation do
    @desc "Create a post"
    field :create_post, type: :post do
      arg(:title, non_null(:string))
      arg(:body, non_null(:string))
      arg(:published_at, :naive_datetime)

      resolve(&Resolvers.Content.create_post/3)
    end
  end
end
