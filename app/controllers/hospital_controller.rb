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
    total_grade = 0
    DepartmentsStudents.find_all_by_student_id(params[:id]).each do |dep|
      grade = params["dep_grade_#{dep.id}"]
      dep.update_attribute("grade", grade)
      total_grade += grade.to_i
    end
  	@student.update_attribute("hostpital_grade", total_grade)
    flash[:notice] = "添加成功"
  	redirect_to :action => :index	
  end
  private 
  def am_i_hospital?
    @member = Member.find(session[:member_id])
    redirect_to login_index_path if @member.auth != 5
  end
end
