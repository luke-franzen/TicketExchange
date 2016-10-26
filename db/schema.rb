# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161024224331) do
=======
ActiveRecord::Schema.define(version: 20161026000955) do
>>>>>>> luke

  create_table "tickets", force: :cascade do |t|
  end

<<<<<<< HEAD
=======
  create_table "tickets_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "ticket_id"
  end

  add_index "tickets_users", ["ticket_id"], name: "index_tickets_users_on_ticket_id"
  add_index "tickets_users", ["user_id"], name: "index_tickets_users_on_user_id"

>>>>>>> luke
  create_table "users", force: :cascade do |t|
  end

end
