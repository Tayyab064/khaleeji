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

ActiveRecord::Schema.define(version: 20210223193238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string   "title",       default: ""
    t.text     "description", default: ""
    t.string   "image",       default: ""
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "publish",     default: true
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",       default: ""
    t.text     "description", default: ""
    t.string   "image",       default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title",       default: ""
    t.text     "description", default: ""
    t.text     "objective",   default: ""
    t.string   "image",       default: ""
    t.float    "price",       default: 0.0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "outlines", force: :cascade do |t|
    t.string   "title",       default: ""
    t.text     "description", default: ""
    t.integer  "course_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["course_id"], name: "index_outlines_on_course_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "status",     default: 0
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "p_status",   default: 0
    t.string   "payment",    default: ""
    t.index ["course_id"], name: "index_purchases_on_course_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question",   default: ""
    t.text     "answer",     default: ""
    t.integer  "article_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["article_id"], name: "index_questions_on_article_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                 default: ""
    t.string   "email"
    t.string   "password_digest"
    t.string   "mobile_number",        default: ""
    t.integer  "gender",               default: 0
    t.integer  "role",                 default: 0
    t.boolean  "verified",             default: false
    t.string   "token"
    t.string   "password_reset_token"
    t.boolean  "block",                default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",       default: ""
    t.string   "url",         default: ""
    t.text     "description", default: ""
    t.integer  "size",        default: 0
    t.integer  "duration",    default: 0
    t.integer  "course_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["course_id"], name: "index_videos_on_course_id", using: :btree
  end

end
