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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131010073047) do

  create_table "replies", :force => true do |t|
    t.string   "body"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_name"
    t.string   "customer_email"
  end

  create_table "statuses", :force => true do |t|
    t.string "name", :limit => 100
  end

  add_index "statuses", ["name"], :name => "index_statuses_on_name", :unique => true

  create_table "tickets", :force => true do |t|
    t.string   "customer_name",  :limit => 100
    t.string   "customer_email", :limit => 100
    t.string   "subject",        :limit => 100
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
    t.integer  "user_id"
  end

  add_index "tickets", ["subject"], :name => "index_tickets_on_subject", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",             :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
