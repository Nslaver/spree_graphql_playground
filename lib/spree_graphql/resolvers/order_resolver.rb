module OrderResolver
  class ByUser
    def self.call(user, args, ctx)
      SpreeOrder.all_by_user(user, ctx[:token])
    end
  end
end
