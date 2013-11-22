class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.text :content
      t.string :line_type
      t.integer :position
      t.integer :character_id
      t.integer :episode_id
      t.timestamps
    end
  end
end
