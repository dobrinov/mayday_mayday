class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :layer
      t.string :name
      t.float :value
      t.string :host
      t.timestamp :valid_until

      t.timestamps null: false
    end
  end
end
