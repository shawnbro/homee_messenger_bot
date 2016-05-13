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

ActiveRecord::Schema.define(version: 20160513200215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_options", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "archived",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "conversations", ["user_id"], name: "index_conversations_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "fb_id"
    t.integer  "conversation_id"
    t.integer  "question_id"
    t.integer  "answer_option_id"
    t.string   "text"
    t.json     "attachments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "messages", ["answer_option_id"], name: "index_messages_on_answer_option_id", using: :btree
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["question_id"], name: "index_messages_on_question_id", using: :btree

  create_table "question_answer_options", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_option_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "question_answer_options", ["answer_option_id"], name: "index_question_answer_options_on_answer_option_id", using: :btree
  add_index "question_answer_options", ["question_id"], name: "index_question_answer_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "prompt"
    t.integer  "ordering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fb_id"
    t.string   "profile_pic"
    t.string   "locale"
    t.integer  "timezone"
    t.string   "gender"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "answer_options"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "questions"
  add_foreign_key "question_answer_options", "answer_options"
  add_foreign_key "question_answer_options", "questions"
end
