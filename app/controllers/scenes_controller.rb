class ScenesController < ApplicationController
  def index
    @scenes = Scene.includes(:lines).all
  end

  def show
    @scene = Scene.find(params[:id])
  end

  def mirror
    @scene = Scene.find(params[:scene_id])
    @characters = @scene.characters
  end

  def random
    @scene = Scene.order("RANDOM()").limit(1).first
    @characters = @scene.characters
  end

end
