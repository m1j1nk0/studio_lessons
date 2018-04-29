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

ActiveRecord::Schema.define(version: 20180429101537) do

  create_table "clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favolites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "lesson_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_favolites_on_lesson_id", using: :btree
    t.index ["member_id"], name: "index_favolites_on_member_id", using: :btree
  end

  create_table "kinds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_kinds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kind_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_id"], name: "index_lesson_kinds_on_kind_id", using: :btree
  end

  create_table "lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "store_id"
    t.integer  "lesson_kind_id"
    t.date     "year_month"
    t.string   "day_of_week"
    t.string   "instractor"
    t.string   "studio"
    t.time     "start_at"
    t.time     "end_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["lesson_kind_id"], name: "index_lessons_on_lesson_kind_id", using: :btree
    t.index ["store_id"], name: "index_lessons_on_store_id", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "club_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_stores_on_club_id", using: :btree
  end

  add_foreign_key "favolites", "lessons"
  add_foreign_key "favolites", "members"
  add_foreign_key "lesson_kinds", "kinds"
  add_foreign_key "lessons", "lesson_kinds"
  add_foreign_key "lessons", "stores"
  add_foreign_key "stores", "clubs"
end
