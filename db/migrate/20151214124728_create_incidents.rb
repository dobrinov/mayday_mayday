class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.integer :policy_id
      t.timestamp :last_available_at
      t.timestamp :resolved_at

      t.timestamps null: false
    end
  end
end
