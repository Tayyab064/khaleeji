class Article < ApplicationRecord

	mount_uploader :image , ImageUploader

	
	has_many :questions , dependent: :destroy
end
