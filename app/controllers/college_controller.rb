class CollegeController < ApplicationController
	before_filter :am_i_college?

  def index
    sql = [" college_id = #{@member.college_id} "]
    # # search by college
    if !params[:grade].nil? && !params[:grade].blank?
      sql.push( " grade = #{params[:grade]} ")
    end
    session[:grade] = params[:grade]
    # paginate for 10 member in each page
    member = Member.find(session[:member_id])
    @students = Student.paginate(:page => params[:page], :per_page => 10, :conditions => [sql.join('and')])
  end

  def assign
    @student = Student.find(params[:id])
    @hospitals = College.find(@student.profession).hospital
    # @hospitals = College.find(@member.college_id).hospital
  end

  def confirm_assign
    @student = Student.find(params[:id])
    @student.update_attributes(params[:student])
    flash[:notice] = "分配成功"
    redirect_to :action => :index
  end

  def student_detials
    @student = Student.find(params[:id])
  end
  
	private 
	def am_i_college?
		@member = Member.find(session[:member_id])
    redirect_to login_index_path if @member.auth != 4
  end
end
