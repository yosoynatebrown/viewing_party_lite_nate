class ViewingPartiesController < ApplicationController
  def new
    @viewing_party = ViewingParty.new
  end

  def create
    viewing_party = ViewingParty.new(party_params)

    if viewing_party.save
      redirect_to "/users/#{user.id}/"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  private
      def party_params
        params.permit(:duration, :email)
      end
end