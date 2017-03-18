class AddUuaaToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :uuaa, :string
  end
end
