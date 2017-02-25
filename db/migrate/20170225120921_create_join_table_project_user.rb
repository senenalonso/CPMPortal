class CreateJoinTableProjectUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :projects, :users do |t|
      t.index [:user_id, :project_id]
    end
  end
end
