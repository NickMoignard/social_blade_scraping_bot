class CreatePeople < ActiveRecord::Migration[6.0]
  def change



    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :primary_email

      t.timestamps
    end

    add_column :people, :aliases, :string, array: true, default: []
    add_column :people, :emails, :string, array: true, default: []

  end
end
