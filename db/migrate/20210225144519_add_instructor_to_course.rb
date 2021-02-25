class AddInstructorToCourse < ActiveRecord::Migration[5.0]
  def change
  	add_column :courses , :instructor_id , :integer
  	add_column :courses , :status , :integer , default: 0
  end
end
