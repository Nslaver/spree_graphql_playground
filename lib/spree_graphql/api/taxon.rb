class SpreeTaxonAPI < SpreeBaseAPI
  API_URL = BASE_API_URL + '/taxons'

  def products(taxon_id)
    RestClient.get "#{ self.class::API_URL }/products", params: { id: taxon_id }.merge(common_params)
  end
end
