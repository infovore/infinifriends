class Episode < ActiveRecord::Base
  has_many :scenes, :order => :position, :dependent => :destroy

  def characters
    scenes.map do |scene|
      scene.lines.select {|l| l.character}.map {|l| l.character}
    end.flatten.uniq
  end
end
