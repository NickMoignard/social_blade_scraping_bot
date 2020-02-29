class CreateSocialPresences < ActiveRecord::Migration[6.0]
  def change
    create_table :social_presences do |t|
      t.boolean :deep_scanned
      t.references :person, index: true
      
      t.timestamps
    end
  end
end
