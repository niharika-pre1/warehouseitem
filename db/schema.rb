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

ActiveRecord::Schema[7.0].define(version: 2023_01_31_095718) do
  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopkeeper_products", force: :cascade do |t|
    t.integer "shopkeeper_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_quantity"
    t.index ["product_id"], name: "index_shopkeeper_products_on_product_id"
    t.index ["shopkeeper_id"], name: "index_shopkeeper_products_on_shopkeeper_id"
  end

  create_table "supplier_products", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_quantity"
    t.index ["product_id"], name: "index_supplier_products_on_product_id"
    t.index ["supplier_id"], name: "index_supplier_products_on_supplier_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouse_products", force: :cascade do |t|
    t.integer "warehouse_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "extended_price"
    t.integer "product_quantity"
    t.index ["product_id"], name: "index_warehouse_products_on_product_id"
    t.index ["warehouse_id"], name: "index_warehouse_products_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_warehouses_on_owner_id"
  end

end
