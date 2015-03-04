class FundingLevelsController < ApplicationController
  before_filter :load_project
  def new
    @funding_level = FundingLevel.new
  end

  def create
    @funding_level = FundingLevel.new(funding_level_params.merge(:project_id => @project.id))
    if @funding_level.save
	  flash[:notice] = "Your fund was successfully created"
      redirect_to project_path(@project)
    else
      render :new
    end
  end
  private

  def funding_level_params
    params.require(:funding_level).permit(:reward_name, :amount)
  end
  
  def load_project
	@project = Project.find(params[:project_id])
  end
end
