class AddFieldsToYoutubeChannels < ActiveRecord::Migration[6.0]
  def change
    add_column :youtube_channels, :daily_views, :integer
    add_column :youtube_channels, :daily_subs, :integer
    add_column :youtube_channels, :weekly_views, :integer
    add_column :youtube_channels, :weekly_subs, :integer
    add_column :youtube_channels, :monthly_views, :integer
    add_column :youtube_channels, :monthly_subs, :integer
    add_column :youtube_channels, :yearly_views, :integer
    add_column :youtube_channels, :yearly_subs, :integer
    add_column :youtube_channels, :country, :string
    add_column :youtube_channels, :type, :string
    add_column :youtube_channels, :channel_created, :datetime
  end
end
