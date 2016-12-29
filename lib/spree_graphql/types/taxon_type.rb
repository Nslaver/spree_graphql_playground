require_relative 'product_type'

TaxonType = GraphQL::ObjectType.define do
  name "Taxon"

  field :id,          !types.ID
  field :name,        !types.String
  field :pretty_name, !types.String

  field :products,    types[ProductType] do
    resolve ProductResolver::ByTaxon
  end
end
