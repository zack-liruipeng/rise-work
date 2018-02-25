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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140203044651) do

  create_table "achievements", :force => true do |t|
    t.integer  "achievement_id"
    t.string   "name"
    t.string   "description"
    t.string   "type"
    t.string   "image"
    t.string   "subject"
    t.text     "tags"
    t.text     "body"
    t.integer  "ppv"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_phase_id"
    t.string   "activity_type"
    t.date     "activity_date"
    t.integer  "amount"
    t.string   "unit"
    t.text     "note"
    t.integer  "ppv"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "article_type"
    t.integer  "article_id"
    t.string   "name"
    t.string   "title"
    t.text     "tags"
    t.text     "description"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "home_dashboards", :force => true do |t|
    t.integer  "people_walking"
    t.integer  "steps_taken_daily"
    t.integer  "steps_increasing_weekly"
    t.integer  "total_steps_taken"
    t.integer  "total_days_of_activity"
    t.string   "performance_indicator"
    t.string   "organization_id"
    t.string   "home_dashboard_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "message_action_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_action_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "message_actions", :force => true do |t|
    t.integer  "phase_id"
    t.integer  "day_to_send"
    t.string   "subject"
    t.text     "tags"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "organizations", :force => true do |t|
    t.integer  "organization_id"
    t.string   "organization_type"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal_code"
    t.string   "time_zone"
    t.integer  "licenses"
    t.string   "secret_key"
    t.text     "note"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "phases", :force => true do |t|
    t.integer  "phase_id"
    t.integer  "study_id"
    t.integer  "order_id"
    t.string   "name"
    t.text     "description"
    t.float    "phase_baseline_percent_increase"
    t.integer  "duration_in_days"
    t.integer  "start_on_day_of_study"
    t.integer  "finish_on_day_of_study"
    t.integer  "daily_phase_goal"
    t.integer  "overall_phase_goal"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "phases_strategies", :force => true do |t|
    t.integer "strategy_id"
    t.integer "phase_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "statuses", :force => true do |t|
    t.integer  "status_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "strategies", :force => true do |t|
    t.integer  "strategy_id"
    t.string   "strategy_type"
    t.string   "strategy_subtype"
    t.integer  "phase_id"
    t.string   "map_image_url"
    t.string   "map_url"
    t.string   "name"
    t.string   "title"
    t.text     "tags"
    t.text     "description"
    t.text     "content"
    t.string   "where"
    t.string   "when"
    t.string   "what"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "studies", :force => true do |t|
    t.integer  "study_id"
    t.string   "study_type"
    t.string   "name"
    t.text     "description"
    t.integer  "duration_in_days"
    t.string   "study_secret_key"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "survey_questions", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "survey_section_id"
    t.integer  "next_question_id"
    t.integer  "previous_question_id"
    t.integer  "skip_to_question_id"
    t.string   "question_type"
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.string   "question"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "survey_sections", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "survey_section_id"
    t.string   "title"
    t.string   "name"
    t.string   "description"
    t.integer  "next_section_id"
    t.integer  "previous_section_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "surveys", :force => true do |t|
    t.integer  "survey_id"
    t.string   "title"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "strategy_id"
    t.integer  "user_phase_id"
    t.string   "name"
    t.string   "description"
    t.string   "where"
    t.string   "when"
    t.string   "what"
    t.string   "activity_amount"
    t.string   "barriers"
    t.string   "task_type"
    t.string   "task_subtype"
    t.datetime "created_at",                         :null => false
    t.datetime "completed_at"
    t.integer  "duration"
    t.integer  "ppv"
    t.boolean  "remainder",       :default => true
    t.boolean  "completed",       :default => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "user_achievements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "achievement_id"
    t.boolean  "is_new",         :default => true
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "user_phases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_study_id"
    t.integer  "phase_id"
    t.integer  "status_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "phase_baseline"
    t.integer  "previous_user_phase"
    t.integer  "next_user_phase"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "user_studies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "study_id"
    t.integer  "status_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "current_user_phase"
    t.integer  "baseline_survey_responceset_id"
    t.integer  "followup_survey_responceset_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "user_survey_responce_sets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.integer  "status_id"
    t.integer  "current_section_id"
    t.integer  "current_question_id"
    t.boolean  "completed",           :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "user_survey_responces", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.integer  "survey_section_id"
    t.integer  "survey_question_id"
    t.integer  "user_survey_responce_set_id"
    t.string   "question_responce"
    t.boolean  "completed",                   :default => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "organization_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "sms_alerts",                           :default => false
    t.boolean  "email_alerts",                         :default => true
    t.boolean  "did_accept_eula",                      :default => false
    t.string   "phone_number"
    t.time     "work_hours_start"
    t.time     "work_hours_finish"
    t.string   "time_zone"
    t.integer  "ppv",                                  :default => 0
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
