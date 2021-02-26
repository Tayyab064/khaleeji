class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title , default: ''
      t.string :image , default: ''
      t.references :course
      t.timestamps
    end
  end
end
