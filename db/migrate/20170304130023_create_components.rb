class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :name
      t.text :description
      t.string :category
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
