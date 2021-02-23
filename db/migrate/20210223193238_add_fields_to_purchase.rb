class AddFieldsToPurchase < ActiveRecord::Migration[5.0]
  def change
  	add_column :purchases , :p_status , :integer , default: 0
  	add_column :purchases , :payment , :string , default: ""
  end
end
