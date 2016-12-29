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
      products {
        name
      }
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

product_taxon_example = <<-GRAPHQL
{
  pr: product(id: 3) {
    classification {
      taxon {
        name
        products {
          name
        }
      }
    }
  }
}
GRAPHQL

# Can be a huge hit on DB!!
products_by_taxon_example = <<-GRAPHQL
{
  products_with_taxon_3_4_and_6: taxons(ids: [3, 4, 6]) {
    name
    id
    products {
      name
      master {
        id
      }
      classification {
        position
        taxon {
          id
          name
          products {
            name
          }
        }
      }
    }
  }
}
GRAPHQL

# puts "Introspection Result"
# pp SpreeSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)

admin_token = '49b9a05392f74da503346207a6ce157482e6be92db444726'
regular_token = 'df1cec4a3531bf1f26c4bf27f087045ea3055b9497e50341'
puts "Running Query 1"
pp SpreeSchema.execute(query1, context: { token: regular_token })
puts "Running Query 2"
pp SpreeSchema.execute(query2, context: { token: regular_token })
puts "Running Query with fragments"
pp SpreeSchema.execute(query_with_fragment, context: { token: regular_token })
puts "Running Product with taxon"
pp SpreeSchema.execute(product_taxon_example, context: { token: regular_token })
puts "Fetching products by taxon ids"
pp SpreeSchema.execute(products_by_taxon_example, context: { token: regular_token })
