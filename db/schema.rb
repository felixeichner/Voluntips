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

ActiveRecord::Schema.define(version: 20170925100500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accom_projects", force: :cascade do |t|
    t.integer "accom_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accom_id", "project_id"], name: "index_accom_projects_on_accom_id_and_project_id"
  end

  create_table "accoms", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animal_projects", force: :cascade do |t|
    t.integer "animal_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id", "project_id"], name: "index_animal_projects_on_animal_id_and_project_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "terrain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "region1"
    t.string "region2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_projects", force: :cascade do |t|
    t.integer "country_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id", "project_id"], name: "index_country_projects_on_country_id_and_project_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "project_tasks", force: :cascade do |t|
    t.integer "project_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "task_id"], name: "index_project_tasks_on_project_id_and_task_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "preview"
    t.text "summary"
    t.text "qualification"
    t.text "work"
    t.text "accomodation"
    t.text "costs"
    t.text "address"
    t.string "tel"
    t.string "email"
    t.string "webpage"
    t.integer "min_weeks"
    t.integer "costs_week"
    t.string "accom_standard"
    t.string "lat"
    t.string "lgt"
    t.string "images"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volun_texts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_volun_texts_on_slug", unique: true
  end

end
