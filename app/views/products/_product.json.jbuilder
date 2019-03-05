json.extract! product, :id, :product_name, :product_description, :created_at, :updated_at
json.url product_url(product, format: :json)
