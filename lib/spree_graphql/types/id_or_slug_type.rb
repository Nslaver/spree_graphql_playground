IdOrSlugType = GraphQL::UnionType.define do
  name "Id or Slug"
  description "Provide Either id or Slug"
  possible_types [types.ID, types.String]
end
