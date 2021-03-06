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

ActiveRecord::Schema.define(version: 20160322171539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string   "category"
    t.string   "repo_url"
    t.string   "title"
    t.datetime "due_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "required"
    t.integer  "cohort_id"
    t.integer  "base_score"
    t.boolean  "public",     default: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "status"
    t.integer  "event_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "membership_id"
    t.boolean  "self_taken",    default: false
    t.datetime "checked_in_at"
    t.string   "ip_address"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "course_id"
    t.integer  "location_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "invite_code"
    t.integer  "number_at_location"
    t.integer  "core_id"
    t.integer  "duration_in_weeks"
    t.integer  "day_of_week"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_users", force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "occurs_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.boolean  "required"
    t.integer  "cohort_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_users", force: :cascade do |t|
    t.integer "location_id"
    t.integer "user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "is_admin",                         null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "status",               default: 0
    t.integer  "cohort_id"
    t.string   "percent_submissions"
    t.string   "percent_attendances"
    t.float    "average_observations"
    t.integer  "outcomes_id"
  end

  create_table "observations", force: :cascade do |t|
    t.integer  "status"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "admin_id"
    t.integer  "membership_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "status"
    t.text     "student_notes"
    t.text     "grader_notes"
    t.integer  "assignment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "admin_id"
    t.integer  "membership_id"
    t.integer  "score"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "membership_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "github_id"
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "api_token"
  end

end
