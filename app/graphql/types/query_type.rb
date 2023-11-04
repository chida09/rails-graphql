module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    # GraphQLクエリでのfield名、GraphQL Type、UserTypeに対して必須かどうか
    field :user, Types::UserType, null: false do
      # クライアントからのGraphQLクエリでの引数、GraphQLでの型、必須かどうか
      argument :id, ID, required: true
    end

    # fieldが指定されたとき、どのようにデータ取得するかをfieldと同名メソッドで実装する
    def user(id:)
      User.find(id)
    end
  end
end
