class Lesson < ApplicationRecord
	mount_uploader :image , ImageUploader

	belongs_to :course
end