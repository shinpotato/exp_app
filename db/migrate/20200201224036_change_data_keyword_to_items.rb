class ChangeDataKeywordToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :keyword, :string
  end
end
