class SpreeUser
  def self.find(id, token)
    user = SpreeUserAPI.new(token).get id
    make_user JSON.parse user.body
  end

  def self.make_user(user_hash)
    OpenStruct.new user_hash
  end
end
