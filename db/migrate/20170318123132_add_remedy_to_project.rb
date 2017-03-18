class AddRemedyToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :remedy, :string
  end
end
