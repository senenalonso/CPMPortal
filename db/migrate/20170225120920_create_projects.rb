class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :code,   null: false
      t.string :name,   null: false
      t.text :description
      t.text :result
      t.date :date_requested,   null: false
      t.date :date_start
      t.date :date_finish
      t.string :scope,   null: false
      t.string :type,   null: false
      t.integer :priority

      t.timestamps
    end
  end
end
