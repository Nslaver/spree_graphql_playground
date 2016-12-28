require_relative 'variant_type'

LineItemType = GraphQL::ObjectType.define do
  name "LineItems"

  field :id, !types.ID

  field :variant, !VariantType do
    resolver VariantResolver::ByLineItem
  end
end
