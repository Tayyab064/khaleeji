class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
	    t.string   "name", default: ""
	    t.string   "email"
	    t.string   "password_digest"
	    t.string   "mobile_number", default: ""
	    t.integer  "gender", default: 0
	    t.integer  "role",  default: 0
	    t.boolean  "verified", default: false
	    t.string   "token"
	    t.string   "password_reset_token"
	    t.boolean  "block", default: false
      t.timestamps
    end
  end
end
