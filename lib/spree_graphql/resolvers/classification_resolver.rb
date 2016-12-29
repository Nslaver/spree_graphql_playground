module ClassificationResolver
  class ByProduct
    def self.call(product, args, ctx)
      product.classifications.collect { |classification| OpenStruct.new(classification) }
    end
  end
end
