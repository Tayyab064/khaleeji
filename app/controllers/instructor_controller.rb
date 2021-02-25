class InstructorController < ApplicationController
	before_action :is_instructor , except: [:signup , :signin , :approve_signin , :approve_signup]

	def signup
		if session[:instructor].present?
			redirect_to '/instructor/index' , notice: 'Error: Already SiginedIn!'
		else
			render :layout => false
		end
	end

	def approve_signup
		p params
		if instructor = User.find_by(email: params[:email])
			if instructor.role == 'instructor'
				noti = 'Error: Already registered , kindly signin'
			else
				noti = 'Error: Use different email to register'
			end
			redirect_to instructor_signup_page_path , notice: noti
		else
			if params[:password] == params[:c_password]
				c = User.create(name: params[:name], email: params[:email], password: params[:password], role: 1)
				session[:instructor] = params[:email]
				redirect_to '/instructor/index' , notice: 'Successfully SignedIn!'
			else
				redirect_to instructor_signup_page_path , notice: 'Error: Password doesnt match'
			end
		end
	end

	def signin
		if session[:instructor].present?
			redirect_to '/instructor/index' , notice: 'Error: Already SiginedIn!'
		else
			render :layout => false
		end
	end

	def approve_signin
		p params
		if instructor = User.where(role: 1).find_by(email: params[:email]).try(:authenticate, params[:password]) 
			if instructor.verified == true && instructor.block == false
				session[:instructor] = params[:email]
				redirect_to '/instructor/index' , notice: 'Successfully SignedIn!'
			else
				redirect_to :back , notice: 'Error: Dont have access to signin'
			end
		else
			redirect_to instructor_signin_page_path , notice: 'Error: Check Email/Password'
		end
	end

	def signout
		session[:instructor] = nil
		redirect_to '/instructor/signin' , notice: 'Successfully SignedOut!'
	end

	def index
	end

	def course
		@course = @instructor.courses.includes(:purchases)
	end

	def add_course

	end

	def save_course
		p params
		if params[:image].present?
			c = Course.create(image: params[:image] , title: params[:title] , price: params[:price] , description: params[:description] , objective: params[:objective] , instructor_id: @instructor.id) 

			p 'Go Baby Go'
			if params[:out_1].length > 0
				Outline.create(title: params[:out_1], description: params[:out_des_1] , course_id: c.id)
			end
			if params[:out_2].length > 0
				Outline.create(title: params[:out_2], description: params[:out_des_2] , course_id: c.id)
			end
			if params[:out_3].length > 0
				Outline.create(title: params[:out_3], description: params[:out_des_3] , course_id: c.id)
			end
			if params[:out_4].length > 0
				Outline.create(title: params[:out_4], description: params[:out_des_4] , course_id: c.id)
			end
			if params[:out_5].length > 0
				Outline.create(title: params[:out_5], description: params[:out_des_5] , course_id: c.id)
			end
			if params[:out_6].length > 0
				Outline.create(title: params[:out_6], description: params[:out_des_6] , course_id: c.id)
			end
			if params[:out_7].length > 0
				Outline.create(title: params[:out_7], description: params[:out_des_7] , course_id: c.id)
			end
			if params[:out_8].length > 0
				Outline.create(title: params[:out_8], description: params[:out_des_8] , course_id: c.id)
			end
			notic = 'Successfully added'
		else
			notic = 'Error: Image Missing'
		end
		redirect_to instructor_add_course_path , notice: notic
	end
end
