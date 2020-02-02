class AddExperienceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :exp_category, :string
    add_column :items, :exp_detail, :text
  end
end
