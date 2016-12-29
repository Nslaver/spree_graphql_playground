require_relative 'variant_type'
require_relative 'classification_type'

ProductType = GraphQL::ObjectType.define do
  name "Product"

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
  field :classification, types[ClassificationType] do
    resolve ClassificationResolver::ByProduct
  end

end
