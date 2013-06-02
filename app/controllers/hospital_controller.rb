class HospitalController < ApplicationController
	before_filter :am_i_hospital?
  def index
  	@students = Student.paginate(:page => params[:page], :per_page => 10, :conditions => ['hospital_id = ?',@member.hospital_id])
  end

  def student_details
  	@student = Student.find(params[:id])
  end

  def student_edit
  	@student = Student.find(params[:id])
  end

  def confirm_add
  	@student = Student.find(params[:id])
  	@student.update_attributes(params[:student])
    flash[:notice] = "添加成功"
  	redirect_to :action => :index	
  end
  private 
  def am_i_hospital?
    @member = Member.find(session[:member_id])
    redirect_to login_index_path if @member.auth != 5
  end
end
