class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :rank
      t.string :grade
      t.string :username, :unique => true
      t.string :uploads
      t.string :subs
      t.string :views
      t.string :url, :unique => true

      t.timestamps
    end
  end
end
