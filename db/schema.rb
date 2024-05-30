# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_01_145937) do
  create_table "budget_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "partida"
    t.string "descripcion"
    t.decimal "monto_disp", precision: 10
    t.date "last_updated"
    t.integer "update_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "clock_num"
    t.string "role"
    t.string "salary_level"
    t.string "delegacion"
    t.boolean "compensations"
    t.decimal "comp_amount", precision: 10
    t.string "status"
    t.decimal "salary", precision: 10
    t.integer "labor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "po_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "suply_id", null: false
    t.integer "qty_ped"
    t.integer "qty_recib"
    t.string "proveedor"
    t.decimal "orig_cost", precision: 10
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "new_cost", precision: 10
    t.index ["purchase_order_id"], name: "index_po_items_on_purchase_order_id"
    t.index ["suply_id"], name: "index_po_items_on_suply_id"
  end

  create_table "po_receipts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "suply_id", null: false
    t.bigint "warehouse_id", null: false
    t.integer "qty"
    t.decimal "new_cost", precision: 10
    t.string "proveedor"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_order_id"], name: "index_po_receipts_on_purchase_order_id"
    t.index ["suply_id"], name: "index_po_receipts_on_suply_id"
    t.index ["user_id"], name: "index_po_receipts_on_user_id"
    t.index ["warehouse_id"], name: "index_po_receipts_on_warehouse_id"
  end

  create_table "purchase_orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.bigint "budget_item_id", null: false
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "calc_spent", precision: 10
    t.decimal "spent", precision: 10
    t.index ["budget_item_id"], name: "index_purchase_orders_on_budget_item_id"
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
  end

  create_table "schools", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cct"
    t.string "nombre"
    t.string "turno"
    t.string "nivel"
    t.string "subnivel"
    t.string "detalle"
    t.integer "matricula"
    t.integer "docentes"
    t.integer "p_de_apoyo"
    t.string "calle"
    t.string "numero"
    t.string "entre_calle"
    t.string "y_calle"
    t.string "colonia"
    t.string "municipio"
    t.string "localidad"
    t.string "ambito"
    t.string "zona_esc"
    t.string "sector"
    t.float "latitud"
    t.float "longitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_transfers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "suply_id", null: false
    t.integer "qty"
    t.integer "warehouse_out"
    t.integer "warehouse_in"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suply_id"], name: "index_stock_transfers_on_suply_id"
    t.index ["user_id"], name: "index_stock_transfers_on_user_id"
  end

  create_table "stocks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "suply_id", null: false
    t.bigint "warehouse_id", null: false
    t.integer "qty"
    t.date "last_updated"
    t.integer "update_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suply_id"], name: "index_stocks_on_suply_id"
    t.index ["warehouse_id"], name: "index_stocks_on_warehouse_id"
  end

  create_table "suplies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "pn"
    t.string "descripcion"
    t.string "presentacion"
    t.bigint "budget_item_id", null: false
    t.decimal "costo_u", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "prev_cost", precision: 10
    t.index ["budget_item_id"], name: "index_suplies_on_budget_item_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "tipo"
    t.string "ubicacion"
    t.string "delegacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "po_items", "purchase_orders"
  add_foreign_key "po_items", "suplies"
  add_foreign_key "po_receipts", "purchase_orders"
  add_foreign_key "po_receipts", "suplies"
  add_foreign_key "po_receipts", "users"
  add_foreign_key "po_receipts", "warehouses"
  add_foreign_key "purchase_orders", "budget_items"
  add_foreign_key "purchase_orders", "users"
  add_foreign_key "stock_transfers", "suplies"
  add_foreign_key "stock_transfers", "users"
  add_foreign_key "stocks", "suplies"
  add_foreign_key "stocks", "warehouses"
  add_foreign_key "suplies", "budget_items"
end
