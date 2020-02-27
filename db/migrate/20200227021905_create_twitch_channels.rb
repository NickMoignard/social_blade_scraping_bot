class CreateTwitchChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :twitch_channels do |t|
      t.string :username, :unique => true
      t.integer :total_followers
      t.integer :total_views

      t.timestamps
    end
  end
end
