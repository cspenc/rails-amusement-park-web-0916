class ChangeMinHeightDataTypeToAttractions < ActiveRecord::Migration
  def change
    change_column :attractions, :min_height, :integer
  end
end
