class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
    @characters = Character.all.sort_by {|c| c.lines.count}.reverse
  end

  def show
    @episode = Episode.find(params[:id], :include => {:scenes => :lines})
  end

  def mirror
    @episode = Episode.includes(:scenes => :lines).joins(:scenes => :lines).find(params[:episode_id])
    @characters = @episode.characters
  end
end
