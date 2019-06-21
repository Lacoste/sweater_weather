class ChangeDefaultValueToCityBkrdColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :cities, :background_img, :string, default: nil
  end
end
