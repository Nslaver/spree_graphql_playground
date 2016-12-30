require_relative 'lib/spree_graphql'
require 'pp'

query1 = <<-GRAPHQL
{
  product_with_id: product(id: 3) {
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
  product_1: product(id: 1) {
    ... productDetails
  }

  product_2: product(id: 2) {
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
  products: taxons {
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

all_products = <<-GRAPHQL
{
  products {
    name
    classification {
      taxon {
        pretty_name
        name
      }
    }
  }
}
GRAPHQL

partial = <<-GRAPHQL
{
  t1: taxons(page: 1, per_page: 1) {
    name
    products {
      name
      master {
        sku
      }
      variants {
        name
      }
    }
  }
  taxon_list: taxons {
    id
    name
  }
}
GRAPHQL

# puts "Introspection Result"
# pp SpreeSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)

admin_token = '49b9a05392f74da503346207a6ce157482e6be92db444726'
regular_token = '1ace9f313ace13c8d86a80819f4b65ed117865116ff55ff3'
# puts "Running Query 1"
# pp SpreeSchema.execute(query1, context: { token: regular_token })
# puts "Running Query 2"
# pp SpreeSchema.execute(query2, context: { token: regular_token })
# puts "Running Query with fragments"
pp SpreeSchema.execute(products_by_taxon_example, context: { token: regular_token })
# puts "Running Product with taxon"
# pp SpreeSchema.execute(partial, context: { token: regular_token })
# puts "Fetching products by taxon ids"
# pp SpreeSchema.execute(query_with_fragment, context: { token: regular_token })
