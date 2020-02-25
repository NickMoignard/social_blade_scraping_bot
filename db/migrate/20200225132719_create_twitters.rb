class CreateTwitters < ActiveRecord::Migration[6.0]
  def change
    create_table :twitters do |t|
      t.integer :avg_retweets
      t.integer :avg_likes
      t.integer :daily_followers
      t.integer :monthly_followers
      t.integer :daily_tweets
      t.integer :monthly_tweets
      t.integer :total_tweets
      t.integer :total_followers
      t.datetime :joined
      t.string :bio
      t.string :website
      t.string :username, :unique => true
      
      t.timestamps
    end
  end
end
