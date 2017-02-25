class RenameTypeColumnProjectByAction < ActiveRecord::Migration[5.0]
  def change
  	rename_column :projects, :type, :action
  end
end
