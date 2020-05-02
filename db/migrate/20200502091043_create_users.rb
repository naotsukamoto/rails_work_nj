class CreateUsers < ActiveRecord::Migration[5.1]
  def change
  create_table "users", primary_key: "id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "login_id", limit: 200, null: false
    t.string "password", limit: 1000, null: false
    t.string "name", limit: 30, null: false
    t.string "email", limit: 265, null: false
    t.integer "sex"
    t.date "birthday"
    t.integer "favorite1", null: false
    t.integer "favorite2"
    t.integer "favorite3"
    t.integer "delete_flg", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  end
end
