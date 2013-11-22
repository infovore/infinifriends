class Episode < ActiveRecord::Base
  has_many :lines, :order => :position
end
