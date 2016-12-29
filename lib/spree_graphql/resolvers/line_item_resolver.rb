module LineItemResolver
  class ByOrder
    def self.call(order, args, ctx)
      unless order.line_items.nil?
        order.line_items.collect { |line_item| OpenStruct.new(line_item) }
      else
        order_details = SpreeOrder.find(order.id, ctx[:token])
        order_details["line_items"].collect { |line_item| OpenStruct.new(line_item) }
      end
    end
  end

end
