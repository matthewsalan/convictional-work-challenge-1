json.array! @inventory.each do |item|
  json.productId item.product_id.to_s
  json.variantId item.id.to_s
  json.stock item.inventory_quantity || 0
end
