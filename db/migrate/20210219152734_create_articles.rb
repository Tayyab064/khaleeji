class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title , default: ''
      t.text :description , default: ''
      t.string :image , default: ''
      t.timestamps
    end
  end
end
