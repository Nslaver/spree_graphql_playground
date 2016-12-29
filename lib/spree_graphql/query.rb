require 'graphql'
require_relative 'fields'

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of the schema'

  field :products, ProductsField
  field :product,  ProductField
  field :user,     UserField
end
