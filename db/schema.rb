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

ActiveRecord::Schema.define(:version => 20120215050310) do

  create_table "field_types", :force => true do |t|
    t.string   "label"
    t.string   "rails_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fields", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "label"
    t.integer  "field_type_id"
    t.text     "instructions"
  end

  create_table "form_fields", :force => true do |t|
    t.integer  "form_id"
    t.integer  "field_id"
    t.integer  "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "display"
  end

  add_index "form_fields", ["field_id"], :name => "index_form_fields_on_field_id"
  add_index "form_fields", ["form_id"], :name => "index_form_fields_on_form_id"

  create_table "form_instances", :force => true do |t|
    t.integer  "form_id"
    t.integer  "respondent_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "next_form_instance_id"
  end

  add_index "form_instances", ["form_id"], :name => "index_form_instances_on_form_id"
  add_index "form_instances", ["respondent_id"], :name => "index_form_instances_on_respondent_id"

  create_table "forms", :force => true do |t|
    t.string   "label"
    t.text     "instructions"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "name"
    t.integer  "next_form_id"
    t.integer  "next_section_form_id"
  end

  create_table "owners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questionnaires", :force => true do |t|
    t.string   "label"
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "start_form_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "respondents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "responses", :force => true do |t|
    t.integer  "form_field_id"
    t.integer  "form_instance_id"
    t.text     "value"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "responses", ["form_field_id"], :name => "index_responses_on_form_field_id"
  add_index "responses", ["form_instance_id"], :name => "index_responses_on_form_instance_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
