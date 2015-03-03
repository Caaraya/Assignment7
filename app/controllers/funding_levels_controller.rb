class FundingLevelsController < ApplicationController
  
  def new
    @funding_level = FundingLevel.new
  end

  def create
    @funding_level = FundingLevel.new(funding_level_params)
    if @funding_level.save
      redirect_to project_path
    else
      render :new
    end
  end
  private

  def funding_level_params
    params.require(:funding_level).permit(:reward_name, :amount)
  end
end
