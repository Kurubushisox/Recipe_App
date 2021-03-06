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

ActiveRecord::Schema.define(version: 20180620135421) do

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "recipe_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["user_id", "recipe_id"], name: "index_likes_on_user_id_and_recipe_id", unique: true

  create_table "made_comment_replies", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "made_comment_id",              null: false
    t.string   "content",         default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "made_comments", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.integer  "recipe_id",               null: false
    t.string   "content",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "post_images", force: :cascade do |t|
    t.string   "mime_type"
    t.binary   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "post_images", ["imageable_type", "imageable_id"], name: "index_post_images_on_imageable_type_and_imageable_id"

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "sort_key"
    t.string   "name"
    t.string   "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"

  create_table "recipe_steps", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "order"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "required_time"
    t.text     "summary"
    t.integer  "serving_for"
    t.boolean  "private",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
