require_relative 'lib/spree_graphql'
require 'pp'

query1 = <<-GRAPHQL
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


query2 = <<-GRAPHQL
{
  me: user(id: 2) {
    email
    orders {
      id
      line_items {
        id
        variant {
          name
        }
      }
    }
  }
}
GRAPHQL

query_with_fragment = <<-GRAPHQL
query getProducts {
  product_1: product(find_by: 1) {
    ... productDetails
  }

  product_2: product(find_by: 2) {
    ... productDetails
  }
}
fragment productDetails on Product {
  id
  name
  master {
    id
  }
}
GRAPHQL

puts "Introspection Result"
pp SpreeSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)

admin_token = '49b9a05392f74da503346207a6ce157482e6be92db444726'
regular_token = 'df1cec4a3531bf1f26c4bf27f087045ea3055b9497e50341'
puts "Running Query 1"
pp SpreeSchema.execute(query1, context: { token: regular_token })
puts "Running Query 2"
pp SpreeSchema.execute(query2, context: { token: regular_token })
puts "Running Query with fragments"
pp SpreeSchema.execute(query_with_fragment, context: { token: regular_token })
