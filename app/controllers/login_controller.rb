class LoginController < ApplicationController
	skip_before_filter :login?

  def index
  end

  def action
  	user = Member.authenticate(params[:member][:account], params[:member][:password])

  	if user.nil?
  		flash[:error] = "用户名/密码错误"
  		redirect_to root_path
  	else
  		session[:member_id] = user.id
  		redirect_to admin_path if user.auth == 1
      redirect_to :controller => :dean, :action => :index if user.auth == 2
      redirect_to :controller => :experiment, :action => :index if user.auth == 3
      redirect_to :controller => :college, :action => :index if user.auth == 4
      redirect_to :controller => :hospital, :action => :index if user.auth == 5
  	end
  end

  def logout
    session[:member_id] = nil
    reset_session
    redirect_to root_path
  end
end
