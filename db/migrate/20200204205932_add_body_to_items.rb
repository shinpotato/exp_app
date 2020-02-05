class AddBodyToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :body, :text
  end
end
