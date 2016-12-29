ProductField = GraphQL::Field.define do
  name          "product"
  description   "Single Product"

  argument :id, !types.ID

  type ProductType

  resolve ProductResolver::One
end
