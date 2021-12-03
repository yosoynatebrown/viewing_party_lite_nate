class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == 'top_rated'
      @results = TmdbFacade.create_top_rated_movies[0..39]
    else
      @results = TmdbFacade.create_search_movies(params[:movie])[0..39]
    end
  end
end
