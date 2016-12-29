require_relative 'variant_type'

LineItemType = GraphQL::ObjectType.define do
  name "LineItems"

  field :id, !types.ID

  field :variant, !VariantType do
    resolve VariantResolver::ByLineItem
  end
end
