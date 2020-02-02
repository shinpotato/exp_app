class RenameNameColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :name, :language
    rename_column :items, :price, :keyword
    

  end
end
