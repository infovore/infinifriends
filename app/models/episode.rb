class Episode < ActiveRecord::Base
  has_many :scenes, :order => :position
end
