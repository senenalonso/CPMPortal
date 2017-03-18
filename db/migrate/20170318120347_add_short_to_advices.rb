class AddShortToAdvices < ActiveRecord::Migration[5.0]
  def change
  	add_column :advices, :short, :string, :default => 'Recomendación'
  end
end
