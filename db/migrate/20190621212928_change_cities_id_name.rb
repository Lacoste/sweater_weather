class ChangeCitiesIdName < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :cities_id, :city_id
  end
end
