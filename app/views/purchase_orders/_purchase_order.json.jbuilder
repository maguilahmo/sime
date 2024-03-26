json.extract! purchase_order, :id, :date, :budget_item_id, :status, :user_id, :spent, :created_at, :updated_at
json.url purchase_order_url(purchase_order, format: :json)
