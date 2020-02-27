class AddHandleToTwitters < ActiveRecord::Migration[6.0]
  def change
    add_column :twitters, :handle, :string, :unique=>true

  end
end
