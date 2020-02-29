class AddBirthdayToTwitterAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :twitter_accounts, :birthday, :string
    add_column :twitter_accounts, :joined_string, :string
    add_column :twitter_accounts, :location, :string
  end
end
