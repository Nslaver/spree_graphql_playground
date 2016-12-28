require 'pry'
require 'graphql'
require_relative 'query'

SpreeSchema = GraphQL::Schema.define do
  query QueryType
end
