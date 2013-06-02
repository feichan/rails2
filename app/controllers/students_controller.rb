class StudentsController < AdminController
  # GET /students
  # GET /students.xml
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
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:student])
    @student.birthday = "#{params[:birth_year]}-#{params[:birth_month]}-#{params[:birth_day]}"
    @student.inter_date = "#{params[:inter_year]}-#{params[:inter_month]}-#{params[:inter_day]}"
    respond_to do |format|
      if @student.save
        flash[:notice] = '添加成功'
        format.html { redirect_to(@student) }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])
    params[:student][:birthday] = "#{params[:birth_year]}-#{params[:birth_month]}-#{params[:birth_day]}"
    params[:student][:inter_date] = "#{params[:inter_year]}-#{params[:inter_month]}-#{params[:inter_day]}"
        
    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = '更新成功.'
        format.html { redirect_to(@student) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end
end
