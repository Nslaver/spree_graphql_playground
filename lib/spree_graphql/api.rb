require 'rest-client'

class SpreeBaseAPI
  BASE_API_URL = "http://localhost:3000/api/v1"

  attr_accessor :token

  def initialize token
    self.token = token
  end

  def get(id, params = {})
    RestClient.get "#{ self.class::API_URL }/#{ id }", params: params.merge(common_params)
  end

  def index(params = {})
    RestClient.get self.class::API_URL, params: params.merge(common_params)
  end

  private
  def common_params
    { token: token }
  end

end


require_relative 'api/product'
require_relative 'api/user'
require_relative 'api/order'
require_relative 'api/taxon'
