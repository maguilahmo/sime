json.extract! po_item, :id, :purchase_order_id, :suply_id, :qty_ped, :qty_recib, :proveedor, :cost, :status, :created_at, :updated_at
json.url po_item_url(po_item, format: :json)
