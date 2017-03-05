class CreateAdvices < ActiveRecord::Migration[5.0]
  def change
    create_table :advices do |t|
      t.text :problem
      t.text :explanation
      t.text :before
      t.text :after
      t.integer :improvement1
      t.string :unit1
      t.string :metric1
      t.integer :improvement2
      t.string :unit2
      t.string :metric2
      t.integer :improvement3
      t.string :unit3
      t.string :metric3
      t.belongs_to :component, foreign_key: true

      t.timestamps
    end
  end
end
