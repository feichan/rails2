class ExperimentController < ApplicationController
	before_filter :am_i_experiment?
  def index
  	sql = []
    # # search by college
    if !params[:college].nil? && !params[:college].blank?
      sql.push( " college_id = #{params[:college]} ")
    end
    session[:college] = params[:college]
    # # search by college
    if !params[:grade].nil? && !params[:grade].blank?
      sql.push( " grade = #{params[:grade]} ")
    end
    session[:grade] = params[:grade]
    # paginate for 10 member in each page
    if !sql.empty?
      @students = Student.paginate(:page => params[:page], :per_page => 10, :conditions => [sql.join('and')])
    else
      @students = Student.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def student_detials
  	@student = Student.find(params[:id])
  end

  def student_edit
  	@student = Student.find(params[:id])
  end

  def confirm_add
  	@student = Student.find(params[:id])
  	@student.update_attributes(params[:student])
  	redirect_to :action => :index	
  end
  private 
  def am_i_experiment?
    member = Member.find(session[:member_id])
    redirect_to login_index_path if member.auth != 3
  end
end
