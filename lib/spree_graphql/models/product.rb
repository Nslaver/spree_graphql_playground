class SpreeProduct

  def self.find_all_by_taxon(taxon, token)
    products = JSON.parse SpreeTaxonAPI.new(token).products taxon.id
    products["products"].collect { |product_hash| make_product product_hash }
  end

  def self.find_all(ids, token)
    ids.collect { |id| find(id, token) }
  end

  def self.find(id, token)
    product = SpreeProductAPI.new(token).get id
    make_product(JSON.parse product.body)
  end

  def self.all(token)
    products = JSON.parse SpreeProductAPI.new(token).index
    products["products"].collect { |product_hash| make_product product_hash }
  end

  def self.make_product(product_hash)
    OpenStruct.new(product_hash)
  end

end
