class CreateCity < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :search_name
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :state_abrev
      t.string :country

      t.timestamps
    end
  end
end
