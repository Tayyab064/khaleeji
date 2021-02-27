class AdminController < ApplicationController
	after_action :allow_iframe
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

	def pending_course
		@course = Course.where(status: 'pending').includes(:purchases)
	end

	def approved_course
		@course = Course.approved.includes(:purchases)
	end

	def block_course
		course = Course.find(params[:id])
		course.update(status: 'blocked')
		redirect_to :back , notice: 'Successfully blocked'
	end

	def approve_course
		course = Course.find(params[:id])
		course.update(status: 'approved')
		redirect_to :back , notice: 'Successfully approved'
	end

	def specific_course
		@course = Course.includes(:outlines).includes(:videos).find(params[:id])
	end

	def students
		@user = User.where(role: 0)
	end

	def instructor
		@user = User.where(role: 1)
	end

	def add_course

	end

	def article
		@article = Article.all
	end

	def add_article

	end

	def save_article
		p params
		if params[:image].present?
			c = Article.create(image: params[:image] , title: params[:title] , description: params[:description] ) 

			p 'Go Baby Go'
			if params[:out_1].length > 0
				Question.create(question: params[:out_1], answer: params[:out_des_1] , article_id: c.id)
			end
			if params[:out_2].length > 0
				Question.create(question: params[:out_2], answer: params[:out_des_2] , article_id: c.id)
			end
			if params[:out_3].length > 0
				Question.create(question: params[:out_3], answer: params[:out_des_3] , article_id: c.id)
			end
			if params[:out_4].length > 0
				Question.create(question: params[:out_4], answer: params[:out_des_4] , article_id: c.id)
			end
			if params[:out_5].length > 0
				Question.create(question: params[:out_5], answer: params[:out_des_5] , article_id: c.id)
			end
			notic = 'Successfully added'
		else
			notic = 'Error: Image Missing'
		end
		redirect_to admin_add_article_path , notice: notic
	end

	def specific_article
		@article = Article.includes(:questions).find(params[:id])
	end

	def announcement
		@announcements = Announcement.all
	end

	def save_announcement

	end

	def add_announcement
		p params
		if params[:image].present?
			c = Announcement.create(image: params[:image] , title: params[:title] , description: params[:description] ) 
			notic = 'Successfully added'
		else
			notic = 'Error: Image Missing'
		end
		redirect_to admin_add_announcement_path , notice: notic
	end

	def announcement_mark_visible
		announ = Announcement.find(params[:id])
		poi = !announ.publish
		p poi
		announ.update(publish: poi)
		redirect_to :back , notice: 'Successfully Done'
	end

	def specific_announcement
		@announcement = Announcement.find(params[:id])
	end

	def update_image_course
		p params
		course = Course.find(params[:id])
		course.update(image: params[:image])
		redirect_to :back , notice: 'Successfully Updated'
	end

	def add_video
		p params
		vid = Video.create(title: params[:title], url: params[:url], description: params[:description], size: params[:size], duration: params[:duration], course_id: params[:id] )
		redirect_to :back , notice: 'Successfully Added'
	end
end
