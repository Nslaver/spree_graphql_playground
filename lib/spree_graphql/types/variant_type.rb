VariantType = GraphQL::ObjectType.define do
  name "Variants"
  field :id,     !types.ID
  field :sku,    !types.String
  field :name,   !types.String
  field :weight,  types.String
  field :height,  types.String
end
