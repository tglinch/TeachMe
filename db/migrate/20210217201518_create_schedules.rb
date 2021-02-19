class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :teacher, foreign_key: true
      t.string :subject
      t.string :description
      t.time :time_from
      t.time :time_to
      t.string :day

      t.timestamps
    end
  end
end
