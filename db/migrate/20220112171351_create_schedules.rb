class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.timestamp :starting_time
      t.timestamp :closing_time
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
