class CreateInstagramAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :instagram_accounts do |t|
      t.string :handle, :unique => true
      t.integer :total_posts
      t.integer :total_followers
      t.string :url
      t.references :social_presence, index: true

      t.timestamps
    end
  end
end
