class Character < ActiveRecord::Base
  has_many :lines

  def episodes
    lines.map {|l| l.scene.episode}.uniq
  end
end
