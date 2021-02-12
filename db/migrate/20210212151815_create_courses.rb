class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title , default: ''
      t.text :description , default: ''
      t.text :objective , default: ''
      t.string :image , default: ''
      t.float :price , default: 0.0
      t.timestamps
    end
  end
end
