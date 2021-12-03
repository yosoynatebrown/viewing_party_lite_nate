class ViewingPartiesController < ApplicationController
  def new
    @viewing_party = ViewingParty.new
    @users = User.all
    @movie = TmdbFacade.movie_details(params[:movie_id])
  end

  def create
    viewing_party = ViewingParty.new(party_params)
    user = User.find(params[:host_id])
    user_ids = params[:users]
    
    if viewing_party.save
      viewing_party.users << user
      user_ids.each do |id|
        invitee = User.find(id.to_i)
        viewing_party.users << invitee
      end
      
      redirect_to "/users/#{user.id}/"
    else
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing_parties/new"
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  private
      def party_params
        params.permit(:length, :date, :start_time, :host_id, :movie_id)
      end
end