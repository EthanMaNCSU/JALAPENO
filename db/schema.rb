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

ActiveRecord::Schema.define(version: 20180302011156) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.string "current_company"
    t.string "linkedin_url"
    t.string "portfolio_url"
    t.text "additional_information"
    t.string "gender"
    t.string "race"
    t.string "veteran_status"
    t.string "disability_status"
    t.integer "job_id"
    t.integer "job_seeker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "In process"
    t.string "document"
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["job_seeker_id"], name: "index_applications_on_job_seeker_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "headquarters"
    t.string "size"
    t.date "founded"
    t.string "industry"
    t.string "revenue"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_seekers", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "full_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "jobs", force: :cascade do |t|
    t.text "description"
    t.text "responsibility"
    t.text "requirement"
    t.string "employment_type"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["company_id", "created_at"], name: "index_recruiters_on_company_id_and_created_at"
    t.index ["company_id"], name: "index_recruiters_on_company_id"
    t.index ["email"], name: "index_recruiters_on_email", unique: true
  end

end
