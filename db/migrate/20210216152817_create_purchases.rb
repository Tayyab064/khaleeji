class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
     t.integer :status , default: 0
     t.references :course
     t.references :user
      t.timestamps
    end
  end
end
