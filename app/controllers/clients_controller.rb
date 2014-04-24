class ClientsController < ApplicationController

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = "Client #{@client.name} added"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Invalid Client Properties"
      redirect_to user_path(current_user)
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :name,
      :partner_id
    )
  end

end