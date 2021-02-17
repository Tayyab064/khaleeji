class Purchase < ApplicationRecord

	belongs_to :course
	belongs_to :user

	enum status: [:learning , :completed , :failed]

end
