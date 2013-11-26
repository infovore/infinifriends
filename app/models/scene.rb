class Scene < ActiveRecord::Base
  has_many :lines, :order => :position
  belongs_to :episode
end
