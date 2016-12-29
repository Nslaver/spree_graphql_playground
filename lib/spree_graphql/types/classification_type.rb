require_relative 'taxon_type'

ClassificationType = GraphQL::ObjectType.define do
  name        "Classification"
  description "Taxon and classification of product"

  field :position, !types.Int

  field :taxon, TaxonType do
    resolve TaxonResolver::ByClassification
  end
end
