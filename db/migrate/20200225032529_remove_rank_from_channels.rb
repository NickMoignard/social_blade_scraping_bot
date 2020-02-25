class RemoveRankFromChannels < ActiveRecord::Migration[6.0]
  def up
    remove_column :channels, :rank
  end

  def down
    change_table :channels do |t|
      t.string :rank
    end
    # Channel.update_all ["rank = ?", '69']
  end
end
