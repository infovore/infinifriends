class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
    @characters = Character.all.sort_by {|c| c.lines.count}.reverse
  end

  def show
    @episode = Episode.find(params[:id], :include => {:scenes => :lines})
  end

  def random
    @episode = Episode.order("RANDOM()").limit(1).first
    @characters = @episode.characters
  end

  def mirror
    @episode =  Episode.find(params[:episode_id])
    @characters = @episode.characters
  end
end
