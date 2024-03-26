json.extract! po_receipt, :id, :purchase_order_id, :suply_id, :warehouse_id, :qty, :new_cost, :proveedor, :user_id, :created_at, :updated_at
json.url po_receipt_url(po_receipt, format: :json)
