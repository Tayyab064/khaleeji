class WebsiteController < ApplicationController
	before_action :is_enduser_check
	before_action :is_enduser , only: [:user]
	def signin
		User.create( name: 'Admin', email: 'admin@connectmedia.ae', password: '123456789' , role: 2, verified: true)
		User.create( name: 'ConnectMedia', email: 'info@connectmedia.ae', password: '123456789' , role: 0, verified: true)
	end

	def signin_save
		if session[:user].present?
			redirect_to :back , notice: "Error: Already SignedIn"
		else
			if usr = User.where(role: 0).find_by(email: params[:username]).try(:authenticate, params[:password])
				if usr.block == false
					session[:user] = params[:username]
					redirect_to '/' , notice: "Successfully SignedIn"
				else
					redirect_to :back , notice: "Error: User is blocked"
				end
			else
				redirect_to :back , notice: "Error: Email/Password doesn't match"
			end
		end
	end

	def signup
		if User.find_by_email(params[:email])
			redirect_to :back , notice: 'Error: Already SignedUp!'
		else
			if params[:password] == params[:password_confirmation]
				c = User.create(name: params[:username]  , email: params[:email] , password: params[:password] , role: 0)
				#UserMailer.usersignup(c).deliver_now
				session[:user] = params[:email]
				redirect_to '/' , notice: 'Successfully SignedUp!'
			else
				redirect_to :back , notice: 'Error: Password doesnot match'
			end
		end
	end

	def index
		@course = Course.all.order(created_at: :desc).limit(4)
	end

	def course
		@course = Course.all.order(created_at: :desc)
	end

	def teacher

	end

	def specific_course
		@course = Course.includes(:outlines).find(params[:id])
	end

	def add_course

	end

	def user
		user = User.find(params[:id])
		unless user == @end_user
			redirect_to :back , notice: "Error: Dont have access to others profile"
		end
	end

	def save_course
		p params
		if params[:image].present?
			c = Course.create(image: params[:image] , title: params[:title] , price: params[:price] , description: params[:description] , objective: params[:objective]) 

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
		redirect_to admin_add_course_path , notice: notic
	end
end
