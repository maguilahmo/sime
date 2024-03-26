json.extract! stock_transfer, :id, :suply_id, :qty, :warehouse_out, :warehouse_in, :user_id, :created_at, :updated_at
json.url stock_transfer_url(stock_transfer, format: :json)
