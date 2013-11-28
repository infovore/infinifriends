class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
  end

  def mirror
    @scene = Scene.find(params[:scene_id])
    @characters = @scene.characters
  end

end
