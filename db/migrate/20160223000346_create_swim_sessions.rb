class CreateSwimSessions < ActiveRecord::Migration
  def change
    create_table   :swim_sessions do |t|
      t.string     :location
      t.integer    :pool_length
      t.date       :date
      t.integer    :minutes_long
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

