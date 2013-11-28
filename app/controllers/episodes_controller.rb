class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
    @characters = Character.all.sort_by {|c| c.lines.count}.reverse
  end

  def show
    @episode = Episode.find(params[:id])
  end
end
