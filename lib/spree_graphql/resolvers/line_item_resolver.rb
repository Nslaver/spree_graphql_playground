module LineItemResolver
  class ByOrder
    def self.call(order, args, ctx)
      order.line_items.collect { |line_item| OpenStruct.new(line_item) }
    end
  end

end
