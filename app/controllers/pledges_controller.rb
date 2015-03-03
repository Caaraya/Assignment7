class PledgesController < ApplicationController
  
  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    if @pledge.save
      redirect_to project_path
    else
      render :new
    end
  end
  private

  def pledge_params
    params.require(:pledge).permit(:name, :email, :amount)
  end
end
