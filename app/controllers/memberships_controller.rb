class MembershipsController < ApplicationController
	before_action :set_membership, :only => [:update, :edit, :show]
	
	def edit
	end

	def show

	end

	def update
		@membership.update(membership_params)
		redirect_to :back
	end

	def set_membership
			@membership = Membership.find(params[:id])
	end

	def membership_params
			params.permit(:event_id, :team_id, :position_id, :membership_id)
	end
end