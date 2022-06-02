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

ActiveRecord::Schema.define(version: 2022_06_02_010029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "cep"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cultures", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cultures_on_user_id"
  end

  create_table "loan_accepteds", force: :cascade do |t|
    t.boolean "acepted"
    t.bigint "user_id", null: false
    t.bigint "loan_proposal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_proposal_id"], name: "index_loan_accepteds_on_loan_proposal_id"
    t.index ["user_id"], name: "index_loan_accepteds_on_user_id"
  end

  create_table "loan_proposals", force: :cascade do |t|
    t.string "conditions"
    t.float "amount"
    t.boolean "accepted"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["user_id"], name: "index_loan_proposals_on_user_id"
  end

  create_table "scoredata", force: :cascade do |t|
    t.float "annual_income"
    t.string "culture"
    t.integer "ha_propriety"
    t.string "garantia"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_scoredata_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.boolean "enviado"
    t.boolean "analise"
    t.boolean "aprovado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cultures", "users"
  add_foreign_key "loan_accepteds", "loan_proposals"
  add_foreign_key "loan_accepteds", "users"
  add_foreign_key "loan_proposals", "users"
  add_foreign_key "scoredata", "users"
end
