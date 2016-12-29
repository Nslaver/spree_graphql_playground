require 'ostruct'
require_relative '../models'

class ProductResolver
  class ByVariant
    def self.call(variant, args, ctx)
      SpreeProduct.find(variant.product_id, ctx[:token])
    end
  end

  class ByTaxon
    def self.call(taxon, args, ctx)
      SpreeProduct.find_all_by_taxon(taxon, ctx[:token])
    end
  end

  class One
    def self.call(obj, args, ctx)
      SpreeProduct.find(args[:id], ctx[:token])
    end
  end

  class All
    def self.call(obj, args, ctx)
      if args[:ids].empty? || args[:slugs].empty?
        SpreeProduct.all(ctx[:token])
      elsif args[:ids].empty?
        SpreeProduct.find_all(args[:slugs], ctx[:token])
      elsif args[:slugs].empty?
        SpreeProduct.find_all(args[:ids], ctx[:token])
      end
    end
  end
end
