class SpreeOrder

  def self.find_all(ids, token)
    ids.collect { |id| find(id, token) }
  end

  def self.find(id, token)
    order = SpreeOrderAPI.new(token).get id
    make_order(JSON.parse order.body)
  end

  def self.all(token)
    orders = JSON.parse SpreeOrderAPI.new(token).index
    orders["orders"].collect { |order_hash| make_order order_hash }
  end

  def self.all_by_user(user, token)
    order = JSON.parse SpreeOrderAPI.new(token).index params: { q: {user_id_eq: user.id } }
    order["orders"].collect { |order_hash| make_order order_hash }
  end

  def self.make_order(order_hash)
    OpenStruct.new(order_hash)
  end

end
