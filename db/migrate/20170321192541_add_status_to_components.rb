class AddStatusToComponents < ActiveRecord::Migration[5.0]
  def change
  	add_column :components, :status, :string, :default => 'En curso'
  end
end
