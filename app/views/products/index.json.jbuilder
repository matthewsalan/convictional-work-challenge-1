json.array! @products do |product|
  json.code product.id.to_s
  json.title product.title
  json.vendor product.vendor
  json.bodyHtml product.body_html
  json.variants product.variants do |variant|
    json.id variant.id.to_s
    json.title variant.title
    json.sku variant.sku
    json.available variant.available || false
    json.inventory_units variant.inventory_quantity || 0
    json.weights do
      json.value variant.weight
      json.unit variant.weight_unit
    end
  end
  json.images product.variants.each do |variant|
    variant.images.each do |image|
      json.source image.source
      json.variantId image.variant_id
    end
  end
end
