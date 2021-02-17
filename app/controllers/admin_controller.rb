class AdminController < ApplicationController
	before_action :is_admin , except: [:signin , :approve_signin]

	def signin
		if session[:admin].present?
			redirect_to '/admin/index' , notice: 'Error: Already SiginedIn!'
		else
			render :layout => false
		end
	end

	def approve_signin
		p params
		if admin = User.where(role: 2).find_by(email: params[:email]).try(:authenticate, params[:password]) 
			if admin.verified == true && admin.block == false
				session[:admin] = params[:email]
				redirect_to '/admin/index' , notice: 'Successfully SignedIn!'
			else
				redirect_to :back , notice: 'Error: Dont have access to signin'
			end
		else
			redirect_to admin_add_course_path , notice: 'Error: Check Email/Password'
		end
	end

	def signout
		session[:admin] = nil
		redirect_to '/admin/signin' , notice: 'Successfully SignedOut!'
	end

	def index
	end

	def course
		@course = Course.includes(:purchases)
	end

	def students
		@user = User.where(role: 0)
	end

	def instructor
		@user = User.where(role: 1)
	end

	def add_course

	end
end
