class CreateInstagrams < ActiveRecord::Migration[6.0]
  def change
    create_table :instagrams do |t|
      t.string :handle, :unique => true
      t.integer :total_posts
      t.integer :total_followers
      t.string :url

      t.timestamps
    end
  end
end
