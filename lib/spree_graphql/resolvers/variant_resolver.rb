module VariantResolver
  class ByProduct
    def self.call(product, args, ctx)
      product.variants.collect do |variant|
        variant_struct = OpenStruct.new(variant)
        variant_struct.product_id = product.id
        variant_struct
      end
    end
  end

  class ProductMaster
    def self.call(product, args, ctx)
      master = OpenStruct.new(product.master)
      master.product_id = product.id
      master
    end
  end

  class ByLineItem
    def self.call(line_item, args, ctx)
      OpenStruct.new(line_item.variant)
    end
  end
end
