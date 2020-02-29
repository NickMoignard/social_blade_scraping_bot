class AddHandleToTwitterAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :twitter_accounts, :handle, :string, :unique=>true

  end
end
