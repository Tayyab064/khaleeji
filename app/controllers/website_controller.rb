class WebsiteController < ApplicationController

	def signin

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

	def save_course
		p params
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
		redirect_to :back
	end
end
