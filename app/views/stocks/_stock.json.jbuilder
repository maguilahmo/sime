json.extract! stock, :id, :suply_id, :warehouse_id, :qty, :last_updated, :update_type, :created_at, :updated_at
json.url stock_url(stock, format: :json)
