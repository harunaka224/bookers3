class RenameBookColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :book, :body
  end
end
