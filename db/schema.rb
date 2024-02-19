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

ActiveRecord::Schema[7.1].define(version: 2024_02_19_102250) do
  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cust_name"
    t.string "address"
    t.string "tel"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "dept_name"
    t.string "loc"
    t.integer "mgr_id"
    t.integer "adept_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adept_id"], name: "index_departments_on_adept_id"
    t.index ["mgr_id"], name: "index_departments_on_mgr_id"
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "dept_id"
    t.string "emp_name"
    t.date "birthday"
    t.date "hiredate"
    t.integer "sex"
    t.decimal "sal", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packedsales", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "psales_no"
    t.date "psales_date"
    t.integer "emp_id"
    t.integer "cust_id"
    t.string "cust_address"
    t.string "cust_tel"
    t.date "delivery_date"
    t.time "delivery_time"
    t.decimal "total", precision: 9, scale: 2
    t.decimal "carriage", precision: 9, scale: 2
    t.decimal "excise", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psales_no"], name: "index_packedsales_on_psales_no", unique: true
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "prod_name"
    t.string "model_no"
    t.decimal "cost", precision: 9, scale: 2
    t.decimal "discount", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "sales_no"
    t.integer "psales_no"
    t.integer "prod_id"
    t.decimal "quantity", precision: 9, scale: 2
    t.decimal "price", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psales_no"], name: "index_sales_on_psales_no"
    t.index ["sales_no"], name: "index_sales_on_sales_no", unique: true
  end

end
