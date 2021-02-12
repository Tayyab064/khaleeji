class CreateOutlines < ActiveRecord::Migration[5.0]
  def change
    create_table :outlines do |t|
      t.string :title , default: ''
      t.text :description , default: ''
      t.references :course
      t.timestamps
    end
  end
end
