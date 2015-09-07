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

ActiveRecord::Schema.define(:version => 20150609082245) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "color_quiz_results", :force => true do |t|
    t.string   "name"
    t.text     "color_description"
    t.string   "color_spectrum"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "contact_form_emails", :force => true do |t|
    t.text     "message"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "design_requests", :force => true do |t|
    t.integer  "user_id"
    t.string   "step"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "package_id"
    t.string   "budget_explanation"
    t.text     "other_wishes"
    t.integer  "budget_type_id"
    t.integer  "life_phase_id"
    t.integer  "project_approach_id"
    t.integer  "style_poll_id"
    t.string   "design_hash"
    t.string   "entered_discount_code"
  end

  create_table "discounts", :force => true do |t|
    t.string   "name"
    t.integer  "amount",          :default => 0, :null => false
    t.integer  "discount_type",   :default => 1, :null => false
    t.datetime "expiration_date"
    t.datetime "start_date"
    t.string   "code"
    t.integer  "package_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "featured_products", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
    t.string   "price"
    t.string   "store_name"
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "comment"
    t.text     "about_project"
    t.string   "style"
    t.string   "budget"
    t.string   "location"
    t.string   "before_image"
    t.string   "after_image"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.integer  "project_type"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "position"
    t.integer  "front_end_type",  :default => 2
  end

  create_table "invite_requests", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "portfolio_web"
    t.string   "portfolio"
    t.string   "resume_web"
    t.string   "resume"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
    t.string   "photo"
  end

  create_table "packages", :force => true do |t|
    t.string   "title"
    t.integer  "price_cents", :default => 0, :null => false
    t.string   "code"
    t.string   "benefits"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "photo_albums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "main_photo_id"
  end

  create_table "photos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "album_id"
    t.string   "image"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "poll_questions", :force => true do |t|
    t.integer  "style_poll_id"
    t.integer  "question_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "poll_questions", ["question_id"], :name => "index_poll_questions_on_question_id"
  add_index "poll_questions", ["style_poll_id", "question_id"], :name => "index_poll_questions_on_style_poll_id_and_question_id", :unique => true
  add_index "poll_questions", ["style_poll_id"], :name => "index_poll_questions_on_style_poll_id"

  create_table "project_albums", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "image"
    t.integer  "main_photo_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "status"
    t.integer  "design_request_id"
  end

  create_table "question_tags", :force => true do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "photo",      :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "reveals", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "from"
    t.string   "style_quiz"
    t.string   "color_quiz"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_items", :force => true do |t|
    t.integer  "room_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_photo_albums", :force => true do |t|
    t.integer "room_id"
    t.integer "photo_album_id"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "design_request_id"
    t.string   "title"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "windows"
    t.string   "rejected_colors"
    t.string   "custom_shops"
    t.integer  "color_set_id"
    t.integer  "fabric_id"
    t.integer  "wood_type_id"
    t.string   "room_size"
    t.text     "used_for"
  end

  create_table "style_polls", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "style_quiz_result_id"
    t.integer  "color_quiz_result_id"
  end

  create_table "style_quiz_results", :force => true do |t|
    t.string   "name"
    t.text     "style_description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "transaction_id"
    t.string   "amount"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_email"
    t.string   "credit_masked_number"
    t.string   "credit_card_type"
    t.integer  "design_request_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "facebook_id"
    t.integer  "twitter_id"
    t.integer  "role_id"
    t.boolean  "is_active"
    t.string   "avatar"
    t.text     "description"
    t.integer  "photo_album_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
