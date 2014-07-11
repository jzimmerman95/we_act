class UsersController < ApplicationController
	
	before_action :set_user, only: [:show]

	def show


	end

	private

		def set_user
			@user = User.find(params[:id])
		end

		def event_params
			params.require(:user).permit(:name, :bio, :city, :state, :interest_list, :category_list)
		end
end

