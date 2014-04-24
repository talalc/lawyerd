class PartnersController < ApplicationController

  def create
    @partner = Partner.new(partner_params)
    @partner.user = current_user
    if @partner.save
      flash[:notice] = "Partner #{@partner.name} added"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Invalid Partner Properties"
      redirect_to user_path(current_user)
    end
  end

  private

  def partner_params
    params.require(:partner).permit(
      :name
    )
  end

end