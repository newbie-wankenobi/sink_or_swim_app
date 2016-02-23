class CreateCircuits < ActiveRecord::Migration
  def change
    create_table :circuits do |t|
      t.integer :num_laps
      t.string :stroke
      t.references :swim_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
