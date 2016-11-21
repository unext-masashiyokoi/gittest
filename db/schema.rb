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

ActiveRecord::Schema.define(version: 20161120110113) do

  create_table "blog_genres", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4
    t.integer  "genre_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "blog_journals", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4
    t.integer  "journal_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "blog_photos", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4
    t.integer  "photo_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "open_range", limit: 1
    t.integer  "user_id",    limit: 4
    t.boolean  "draft_flg",  limit: 1,     default: false
    t.string   "image",      limit: 255
  end

  create_table "calendars", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "content",        limit: 255
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "place",          limit: 255
    t.string   "open_range",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "journals_id", limit: 4
  end

  create_table "category_journal_rels", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.integer  "journal_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter",  limit: 255
    t.text     "body",       limit: 16777215
    t.integer  "blog_id",    limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree

  create_table "cycles", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "content",     limit: 65535
    t.time     "time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "priority",    limit: 4
    t.integer  "cost",        limit: 4
    t.integer  "category_id", limit: 4
  end

  create_table "distances", force: :cascade do |t|
    t.integer  "distance",       limit: 4
    t.string   "transportation", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "equip_genres", force: :cascade do |t|
    t.integer  "equip_id",   limit: 4
    t.integer  "genre_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "equips", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "detail",     limit: 16777215
    t.date     "date"
    t.string   "status",     limit: 1
    t.integer  "priority",   limit: 2
    t.string   "bland",      limit: 255
    t.integer  "price",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image_link", limit: 255
    t.text     "pr_link",    limit: 65535
    t.string   "image",      limit: 255
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "content",        limit: 255
    t.datetime "start"
    t.datetime "end"
    t.string   "place",          limit: 255
    t.string   "open_range_id",  limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "category_id",    limit: 4
    t.integer  "project_id",     limit: 4
    t.string   "reference_link", limit: 255
  end

  create_table "finances", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "contents",   limit: 65535
    t.date     "date"
    t.string   "subject",    limit: 255
    t.integer  "price",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "target_user_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "follows", ["user_id", "target_user_id"], name: "index_follows_on_user_id_and_target_user_id", unique: true, using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "content",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "sponsor_link", limit: 65535
  end

  create_table "income_statements", force: :cascade do |t|
    t.date     "date"
    t.integer  "ses_business_revenue",    limit: 4
    t.integer  "representative_reward",   limit: 4
    t.integer  "personnel_expenses",      limit: 4
    t.integer  "sales_support_fee",       limit: 4
    t.integer  "social_insurance_costs",  limit: 4
    t.integer  "tax_expense",             limit: 4
    t.integer  "business_tax",            limit: 4
    t.integer  "delay_loss",              limit: 4
    t.integer  "communications_expenses", limit: 4
    t.integer  "transportation_cost",     limit: 4
    t.integer  "capital_investment",      limit: 4
    t.integer  "advertising_expenses",    limit: 4
    t.integer  "entertainment_expenses",  limit: 4
    t.integer  "affairs_costs",           limit: 4
    t.integer  "shareholder_costs",       limit: 4
    t.integer  "lower_costs",             limit: 4
    t.integer  "debt_costs",              limit: 4
    t.integer  "realestate",              limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "subject",         limit: 255
    t.integer  "project_id",      limit: 4
    t.integer  "estimated_hours", limit: 4
    t.integer  "assigned_to_id",  limit: 4
    t.integer  "status_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image_link",      limit: 255
  end

  create_table "journals", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "content",       limit: 255
    t.float    "distance",      limit: 24
    t.time     "time"
    t.date     "date"
    t.string   "place",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "project_id",    limit: 4
    t.integer  "cost",          limit: 4
    t.integer  "genre_id",      limit: 4
    t.integer  "distance_id",   limit: 4
    t.integer  "open_range_id", limit: 4
    t.integer  "issue_id",      limit: 4
  end

  create_table "memos", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "transportation", limit: 255
    t.float    "distance",       limit: 24
    t.time     "time"
    t.integer  "journal_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "open_ranges", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "detail",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "personal_incomestatements", force: :cascade do |t|
    t.integer  "car_loan",         limit: 4
    t.integer  "lower",            limit: 4
    t.integer  "credit",           limit: 4
    t.integer  "shopping_loan",    limit: 4
    t.integer  "yokoi_info",       limit: 4
    t.integer  "friend",           limit: 4
    t.integer  "family",           limit: 4
    t.integer  "health_care",      limit: 4
    t.integer  "basic_costs",      limit: 4
    t.integer  "clothes_costs",    limit: 4
    t.integer  "reisure_costs",    limit: 4
    t.integer  "car_tax",          limit: 4
    t.integer  "car_insurance",    limit: 4
    t.integer  "social_insurance", limit: 4
    t.integer  "life_insurance",   limit: 4
    t.integer  "housing_costs",    limit: 4
    t.integer  "saraly",           limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.date     "date"
    t.integer  "ironman_costs",    limit: 4
    t.integer  "partner",          limit: 4, default: 0
    t.integer  "income_tax",       limit: 4
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "comment",    limit: 16777215
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image",      limit: 255
    t.integer  "genre_id",   limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "target",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "content",        limit: 65535
    t.integer  "category_id",    limit: 4
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "status_id",      limit: 4
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "detail",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_genres", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "genre_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.text     "profile",                limit: 65535
    t.string   "account_id",             limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "blogs"
end
