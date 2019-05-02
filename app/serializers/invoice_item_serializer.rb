class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :invoice_id, :unit_price, :quantity, :item_id
  attribute :unit_price do |atr|
    (atr.unit_price * 0.01).to_s
  end
end
