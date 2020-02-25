class AddFieldsToChannels < ActiveRecord::Migration[6.0]
  def change
    add_column :channels, :daily_views, :integer
    add_column :channels, :daily_subs, :integer
    add_column :channels, :weekly_views, :integer
    add_column :channels, :weekly_subs, :integer
    add_column :channels, :monthly_views, :integer
    add_column :channels, :monthly_subs, :integer
    add_column :channels, :yearly_views, :integer
    add_column :channels, :yearly_subs, :integer
    add_column :channels, :country, :string
    add_column :channels, :type, :string
    add_column :channels, :channel_created, :datetime
  end
end
