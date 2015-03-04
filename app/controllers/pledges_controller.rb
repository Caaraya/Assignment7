class PledgesController < ApplicationController
  before_filter :load_project_and_funding_levels
  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params.merge(:funding_level_id => find_appropriate_reward))
    if @pledge.save
		flash[:notice] = "Your pledge was successfully created"
      redirect_to project_path(@project)
    else
      render :new
    end
  end
  private

  def pledge_params
    params.require(:pledge).permit(:name, :email, :amount, :funding_level_id)
  end
   def load_project_and_funding_levels
 	@project = Project.find(params[:project_id])
 	@funding_levels = @project.funding_levels
  end

  def find_appropriate_reward
	#funding_levels = FundingLevel.where(:project_id => @project.id).sort_by{|obj| obj.ammount} #@project.funding_levels.sort_by {|obj| obj.amount}-
	funding_levels = @project.funding_levels.sort_by {|obj| obj.amount}
	result = nil
	
	funding_levels.each do |lvl|
		if @amount >= lvl.amount
			result = lvl
		else
			break
		end
	end
	result.id
  end
end