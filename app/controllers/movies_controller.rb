class MoviesController < ApplicationController
  def index
    @user = current_user
    if params[:q] == 'top_rated'
      @results = TmdbFacade.create_top_rated_movies[0..39]
    else
      @results = TmdbFacade.create_search_movies(params[:movie])[0..39]
    end
  end
  def show
    begin 
      @user = current_user
    rescue ActiveRecord::RecordNotFound => e
      flash[:alert] = "Error: You must be logged in or registered to create a movie party"
    ensure
      @movie = TmdbFacade.movie_details(params[:id])
      @reviews = TmdbFacade.create_reviews(params[:id])
    end
  end
end
