class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.integer :pax
      t.float :budget
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
