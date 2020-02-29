class AddBioToInstagramAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :instagram_accounts, :bio, :text
  end
end
