class AddPositionToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :position, :integer
  end
end
