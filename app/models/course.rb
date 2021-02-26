class Course < ApplicationRecord
	mount_uploader :image , ImageUploader

	has_many :outlines , dependent: :destroy
	has_many :videos , dependent: :destroy
	has_many :lessons , dependent: :destroy
	has_many :purchases , dependent: :destroy

	belongs_to :instructor , class_name: 'User'

	enum status: [:pending , :approved , :blocked ]

	scope :approved, lambda {where(:status => 'approved')}
end
