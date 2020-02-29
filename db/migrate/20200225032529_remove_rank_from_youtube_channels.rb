class RemoveRankFromYoutubeChannels < ActiveRecord::Migration[6.0]
  def up
    remove_column :youtube_channels, :rank
  end

  def down
    change_table :youtube_channels do |t|
      t.string :rank
    end
    # Channel.update_all ["rank = ?", '69']
  end
end
