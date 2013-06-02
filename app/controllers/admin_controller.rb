class AdminController < ApplicationController
	before_filter :am_i_admin?

	def index
		
	end

	def get_profession
		college_id = params[:college_id]
		if college_id == ""
			@professions = []
		else
			@professions = College.professions(college_id)
		end
		respond_to do |format|
      format.html { render :layout => false}
    end
	end

	private 
	def am_i_admin?
		member = Member.find(session[:member_id])
    redirect_to login_index_path if member.auth != 1
  end
end
