require_relative 'line_item_type'

OrderType = GraphQL::ObjectType.define do
  name "Orders"

  field :id, !types.ID

  field :line_items, !types[LineItemType] do
    resolve LineItemResolver::ByOrder
  end
end
