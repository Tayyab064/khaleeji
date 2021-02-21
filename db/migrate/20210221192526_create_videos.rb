class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title , default: ''
      t.string :url , default: ''
      t.text :description , default: ''
      t.integer :size , default: 0
      t.integer :duration , default: 0
      t.references :course
      t.timestamps
    end
  end
end
