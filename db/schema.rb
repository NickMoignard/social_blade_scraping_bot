# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_25_132719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "grade"
    t.string "username"
    t.string "uploads"
    t.string "subs"
    t.string "views"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "daily_views"
    t.integer "daily_subs"
    t.integer "weekly_views"
    t.integer "weekly_subs"
    t.integer "monthly_views"
    t.integer "monthly_subs"
    t.integer "yearly_views"
    t.integer "yearly_subs"
    t.string "country"
    t.string "type"
    t.datetime "channel_created"
  end

  create_table "twitters", force: :cascade do |t|
    t.integer "avg_retweets"
    t.integer "avg_likes"
    t.integer "daily_followers"
    t.integer "monthly_followers"
    t.integer "daily_tweets"
    t.integer "monthly_tweets"
    t.integer "total_tweets"
    t.integer "total_followers"
    t.datetime "joined"
    t.string "bio"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
