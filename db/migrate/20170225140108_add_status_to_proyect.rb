class AddStatusToProyect < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :status, :string, :default => 'Sin asingnar'
  end
end
