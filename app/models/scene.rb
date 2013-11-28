class Scene < ActiveRecord::Base
  has_many :lines, :order => :position, :dependent => :destroy
  belongs_to :episode

  def self.create_from_processed_scene_for_episode_in_position(scene,episode,position)
    s = Scene.create(:episode_id => episode.id,
                  :description => scene[:title],
                  :position => position)
    scene[:lines].each_with_index do |line, i|
      count = i+1
      Line.create_from_processed_line_for_scene_in_position(line,s,count)
    end
  end

  def characters
    lines.select {|l| l.character}.map {|l| l.character}.uniq
  end
end
