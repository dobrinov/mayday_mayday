class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :layer
      t.string :name
      t.string :type
      t.float :value
      t.float :percentile
      t.boolean :inverted, default: false
      t.integer :policy_id

      t.timestamps null: false
    end
  end
end
