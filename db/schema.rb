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

ActiveRecord::Schema.define(version: 20141210193957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "course_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "course_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "anc_desc_idx", unique: true, using: :btree
  add_index "course_hierarchies", ["descendant_id"], name: "desc_idx", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "credits"
    t.string   "subtitle"
    t.boolean  "published",      default: false
    t.string   "ancestry"
    t.integer  "ancestry_depth", default: 0
    t.boolean  "gradeable",      default: false
  end

  create_table "grades", force: true do |t|
    t.integer  "grader_id"
    t.integer  "student_id"
    t.integer  "course_id"
    t.decimal  "value",         precision: 6, scale: 2
    t.text     "notes"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "private_notes"
  end

  add_index "grades", ["grader_id"], name: "index_grades_on_grader_id", using: :btree
  add_index "grades", ["student_id", "course_id"], name: "index_grades_on_student_id_and_course_id", using: :btree

  create_table "group_users", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["user_id", "group_id"], name: "index_group_users_on_user_id_and_group_id", unique: true, using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["ancestry"], name: "index_groups_on_ancestry", using: :btree

  create_table "groups_users", id: false, force: true do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "groups_users", ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", unique: true, using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "student_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_members", ["group_id"], name: "index_student_members_on_group_id", using: :btree
  add_index "student_members", ["user_id", "course_id"], name: "index_student_members_on_user_id_and_course_id", unique: true, using: :btree

  create_table "transactions", force: true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.decimal  "amount",      precision: 8, scale: 2
    t.text     "description"
    t.datetime "occurred_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "transactions", ["type", "user_id"], name: "index_transactions_on_type_and_user_id", using: :btree

  create_table "tutor_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "ordinal"
    t.boolean  "can_grade",        default: false
    t.string   "role_name"
    t.text     "role_description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "tutor_members", ["ordinal"], name: "index_tutor_members_on_ordinal", using: :btree
  add_index "tutor_members", ["user_id", "course_id"], name: "index_tutor_members_on_user_id_and_course_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "public_email"
    t.string   "private_email"
    t.string   "password_digest"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "country_code"
    t.decimal  "financial_status", precision: 8, scale: 2, default: 0.0
    t.string   "photo"
    t.text     "description"
    t.string   "gender"
    t.date     "dob"
    t.integer  "mach_id"
    t.text     "data"
    t.hstore   "meta"
    t.string   "invitation_code"
    t.string   "title"
    t.integer  "clearance",                                default: 0,   null: false
  end

  add_index "users", ["clearance"], name: "index_users_on_clearance", using: :btree
  add_index "users", ["financial_status"], name: "index_users_on_financial_status", using: :btree
  add_index "users", ["invitation_code"], name: "index_users_on_invitation_code", using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
