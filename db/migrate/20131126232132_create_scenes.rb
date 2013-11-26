class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :description
      t.integer :episode_id
      t.timestamps
    end
  end
end
