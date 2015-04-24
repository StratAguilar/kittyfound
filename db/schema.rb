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

ActiveRecord::Schema.define(version: 20150424013136) do

  create_table "cat_breeds", force: :cascade do |t|
    t.string   "breed",              limit: 30,  null: false
    t.string   "coat",               limit: 40
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "cats", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.string   "color",      limit: 20
    t.string   "breed",      limit: 50
    t.string   "size",       limit: 12
    t.string   "coat",       limit: 12
    t.string   "age",        limit: 12
    t.string   "sex",        limit: 8
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "cats", ["post_id"], name: "index_cats_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "post_type",          limit: 4,     default: 0,     null: false
    t.string   "title",              limit: 60,                    null: false
    t.text     "description",        limit: 65535,                 null: false
    t.string   "city",               limit: 50
    t.boolean  "expired",            limit: 1,     default: false, null: false
    t.date     "date"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255,                 null: false
    t.string   "username",        limit: 50
    t.string   "phone",           limit: 10
    t.string   "password_digest", limit: 255
    t.string   "string",          limit: 255
    t.string   "user_type",       limit: 3,   default: "IND", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
