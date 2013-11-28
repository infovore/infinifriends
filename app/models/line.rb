class Line < ActiveRecord::Base
  belongs_to :scene
  belongs_to :character

  def sentence_count
    content.split(". ").size
  end

  def self.create_from_processed_line_for_scene_in_position(line,scene,position)
    if line[:type] == :line
      character = Character.find_or_create_by_name(line[:character])
      character_id = character.id
    else
      character_id = nil
    end

    Line.create(:character_id => character_id,
                :line_type => line[:type],
                :position => position,
                :scene_id => scene.id,
                :content => line[:content])

  end

  def self.strip_directions(line)
    line.gsub(/(\(.+?\))/, "")
  end
end
