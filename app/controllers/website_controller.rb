class WebsiteController < ApplicationController
	#before_action :allow_iframe
	before_action :is_enduser_check
	before_action :is_enduser , only: [:user , :buy_course]
	
	def signin
		
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
				c = User.new
				c.name = params[:username]
				c.email = params[:email]
				c.role = 0
				#my_password = BCrypt::Password.create(params[:password])
				#p my_password
				c.password = params[:password]
				if c.save
					session[:user] = params[:email]
					redirect_to '/' , notice: 'Successfully SignedUp!'
				else
					redirect_to :back , notice: 'Error: Something went wrong ' + c.errors
				end
			else
				redirect_to :back , notice: 'Error: Password doesnot match'
			end
		end
	end

	def signout
		if session[:user].present?
			session[:user] = nil
			redirect_to '/' , notice: "Successfully Signedout"
		else
			redirect_to '/' , notice: 'Error: Signin first'
		end
	end

	def index
		@course = Course.all.order(created_at: :desc).limit(4)
		@articles = Article.order(created_at: :desc).limit(2)
		@announc = Announcement.order(created_at: :desc).limit(2)
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
		@course = user.purchases
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

	def buy_course
		p params
		if @end_user.role == 'end_user'
			if @end_user.purchases.pluck(:course_id).include? params[:course_id].to_i
				noti = 'Error: Already purchased this course'
			else
				pu = Purchase.create(payment: params[:pay_method] , course_id: params[:course_id] , user_id: @end_user.id)
				noti = 'Successfully Purchases'
			end
		else
			noti = 'Error: Dont have access to purchase this course'
		end
		redirect_to :back , notice: noti
	end

	def specific_article
		@article = Article.includes(:questions).find(params[:id])
	end

	def articles
		@articles = Article.order(created_at: :desc)
	end

	def announcements
		@announ = Announcement.order(created_at: :desc)
	end
end
