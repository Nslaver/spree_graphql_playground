class SpreeOrderAPI < SpreeBaseAPI
  API_URL = BASE_API_URL + '/orders'

  def mine(params = {})
    RestClient.get "#{ self.class::API_URL }/mine", params: params.merge(common_params)
  end
end
