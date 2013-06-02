class DeanController < ApplicationController
	before_filter :am_i_dean?

  def index
  end

  def student_list
    sql = []
    # search by college
    if !params[:college].nil? && !params[:college].blank?
      sql.push( " college_id = #{params[:college]} ")
    end
    session[:college] = params[:college]
    # search by college
    if !params[:grade].nil? && !params[:grade].blank?
      sql.push( " grade = #{params[:grade]} ")
    end
    session[:grade] = params[:grade]
    # search by hospital
    if !params[:hospital].nil? && !params[:hospital].blank?
      sql.push( " hospital_id = #{params[:hospital]} ")
    end
    session[:hospital] = params[:hospital]
    # paginate for 10 member in each page
    if !sql.empty?
      @students = Student.paginate(:page => params[:page], :per_page => 10, :conditions => [sql.join('and')])
    else
      @students = Student.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def student_detail
  	@student = Student.find(params[:id])
  end

  def college_list
    @colleges = College.paginate(:page => params[:page], :per_page => 10, :conditions => ["parent_id = ?",0])
  end

  def hospital_assign
    @collage_id = params[:id]
    @existed = []
    CollegesHospitals.find_all_by_college_id(@collage_id).each {|h|@existed.push(h.hospital_id.to_i)}
    @hospitals = Hospital.all
  end

  def confirm_assin
    @hostpital = params[:hostpital]
    @college_id = params[:college_id]
    esxits = CollegesHospitals.find_all_by_college_id(@college_id)
    if @hostpital.nil?
      esxits.each do |ch|
        ch.destroy
      end
    else
      esxits_id = []
      esxits.each do |ch|
        ch.destroy if !@hostpital.include?(ch.hospital_id)
        esxits_id.push(ch.id.to_i) if @hostpital.include?(ch.hospital_id)
      end
      @hostpital.each do |hosp|
        if !esxits_id.include?(hosp)
          assin = CollegesHospitals.new
          assin.hospital_id = hosp
          assin.college_id = @college_id
          assin.save
        end
      end
      flash[:notice] == "分配成功"
    end
    redirect_to :action => :college_list
  end
  private 
  def am_i_dean?
    member = Member.find(session[:member_id])
    redirect_to login_index_path if member.auth != 2
  end
end
