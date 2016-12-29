require_relative 'product_type'

VariantType = GraphQL::ObjectType.define do
  name "Variants"
  field :id,     !types.ID
  field :sku,    !types.String
  field :name,   !types.String
  field :weight,  types.String
  field :height,  types.String
  field :product, ProductType do
    resolve ProductResolver::ByVariant
  end
end
