require_relative 'variant_type'

ProductType = GraphQL::ObjectType.define do
  name "Products"

  field :id,          !types.ID
  field :name,        !types.String
  field :description, !types.String
  field :slug,        !types.String
  field :master,      !VariantType do
    resolve VariantResolver::ProductMaster
  end
  field :variants,    types[VariantType] do
    resolve VariantResolver::ByProduct
  end
end
