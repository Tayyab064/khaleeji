class AddPublishToAnnouncement < ActiveRecord::Migration[5.0]
  def change
  	add_column :announcements , :publish , :boolean , default: true
  end
end
