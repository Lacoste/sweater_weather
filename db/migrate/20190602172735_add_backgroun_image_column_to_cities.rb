class AddBackgrounImageColumnToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :background_img, :string
  end
end
