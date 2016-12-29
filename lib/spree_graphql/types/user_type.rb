require_relative 'order_type'

UserType = GraphQL::ObjectType.define do
  name "User"

  field :id,    !types.ID
  field :email, !types.String

  field :orders, types[OrderType] do
    resolve OrderResolver::ByUser
  end

end
