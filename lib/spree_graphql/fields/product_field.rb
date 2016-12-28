ProductField = GraphQL::Field.define do
  name          "product"
  description   "Single Product"

  argument :find_by, types.ID, default_value: nil

  type ProductType

  resolve ProductResolver::One
end
