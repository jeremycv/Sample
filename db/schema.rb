# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110721111306) do

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "employee_id"
    t.integer  "team_id"
    t.string   "status"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.float    "level"
    t.boolean  "active"
    t.float    "currency"
    t.float    "score"
    t.date     "last_performed"
    t.string   "status"
    t.string   "comment"
    t.boolean  "reportable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "last_changed"
    t.string   "complexity",             :null => false
    t.integer  "red_threshold"
    t.integer  "amber_threshold"
    t.float    "currency_level"
    t.integer  "number_people_required"
    t.boolean  "availability"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name",          :limit => 50, :null => false
    t.string   "business_unit"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
