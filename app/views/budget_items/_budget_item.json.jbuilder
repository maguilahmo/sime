json.extract! budget_item, :id, :partida, :descripcion, :monto_disp, :last_updated, :update_type, :created_at, :updated_at
json.url budget_item_url(budget_item, format: :json)
