class SpreeTaxon
  def self.find_all(ids, token)
    taxons = JSON.parse SpreeTaxonAPI.new(token).index({ ids: ids.join(",") })
    taxons["taxons"].collect { |taxon_hash| make_taxon taxon_hash }
  end

  def self.make_taxon taxon_hash
    OpenStruct.new(taxon_hash)
  end
end
