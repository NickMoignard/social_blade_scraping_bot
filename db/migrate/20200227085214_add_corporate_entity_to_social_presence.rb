class AddCorporateEntityToSocialPresence < ActiveRecord::Migration[6.0]
  def change
    add_column :social_presences, :corporate_entity, :boolean
  end
end
