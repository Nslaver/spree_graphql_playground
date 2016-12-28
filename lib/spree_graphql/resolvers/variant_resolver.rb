module VariantResolver
  class ByProduct
    def self.call(product, args, ctx)
      product.variants.collect { |variant| OpenStruct.new(variant) }
    end
  end

  class ProductMaster
    def self.call(product, args, ctx)
      OpenStruct.new(product.master)
    end
  end

  class ByLineItem
    def self.call(line_item, args, ctx)
      OpenStruct.new(line_item.variant)
    end
  end
end
