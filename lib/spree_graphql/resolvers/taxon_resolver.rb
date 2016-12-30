module TaxonResolver
  class All
    def self.call(obj, args, ctx)
      SpreeTaxon.find_all(args, ctx[:token])
    end
  end

  class ByClassification
    def self.call(classification, args, ctx)
      OpenStruct.new(classification.taxon)
    end
  end
end
