class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @speakers = current_user.favorite_speakers.decorate
  end
end
