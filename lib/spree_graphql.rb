require_relative 'spree_graphql/schema'


puts "Demo Queries Code"

query = <<-GRAPHQL
{
  product_with_id: product(find_by: 3) {
    id
    name
    master {
      id
      sku
    }
    variants {
      id
      sku
    }
  }

  product_filtered_by_id: products(ids: [1, 3]) {
    id
    name
    master {
      id
      sku
    }
    variants {
      id
      sku
    }
  }
}
GRAPHQL

puts "Running Query:"
puts SpreeSchema.execute(query, context: { token: 'df1cec4a3531bf1f26c4bf27f087045ea3055b9497e50341' })
