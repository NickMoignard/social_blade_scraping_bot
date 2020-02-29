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

ActiveRecord::Schema.define(version: 2020_02_28_014132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instagram_accounts", force: :cascade do |t|
    t.string "handle"
    t.integer "total_posts"
    t.integer "total_followers"
    t.string "url"
    t.bigint "social_presence_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
    t.index ["social_presence_id"], name: "index_instagram_accounts_on_social_presence_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "primary_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "aliases", default: [], array: true
    t.string "emails", default: [], array: true
  end

  create_table "social_presences", force: :cascade do |t|
    t.boolean "deep_scanned"
    t.bigint "person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "corporate_entity"
    t.index ["person_id"], name: "index_social_presences_on_person_id"
  end

  create_table "twitch_channels", force: :cascade do |t|
    t.string "username"
    t.integer "total_followers"
    t.integer "total_views"
    t.bigint "social_presence_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["social_presence_id"], name: "index_twitch_channels_on_social_presence_id"
  end

  create_table "twitter_accounts", force: :cascade do |t|
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
    t.string "username"
    t.bigint "social_presence_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "handle"
    t.string "birthday"
    t.string "joined_string"
    t.string "location"
    t.index ["social_presence_id"], name: "index_twitter_accounts_on_social_presence_id"
  end

  create_table "youtube_channels", force: :cascade do |t|
    t.string "grade"
    t.string "username"
    t.string "uploads"
    t.string "subs"
    t.string "views"
    t.string "url"
    t.bigint "social_presence_id"
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
    t.index ["social_presence_id"], name: "index_youtube_channels_on_social_presence_id"
  end

end
