class NestScenesCorrectly < ActiveRecord::Migration
  def change
    add_column :lines, :scene_id, :integer
    remove_column :lines, :episode_id, :integer
  end
end
