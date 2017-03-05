class AddStatusToAdvice < ActiveRecord::Migration[5.0]
  def change
  	add_column :advices, :status, :string, :default => 'En desarrollo'
  end
end
