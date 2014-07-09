class MembershipsController < ApplicationController
	
	def update
		@membership.update(membership_params)
	end

	def set_membership
			@membership = Membership.find(params[:id])
	end

	def membership_params
			params.require(:membership).permit(:user_id, :event_id, :team_id, :position_id)
	end
end