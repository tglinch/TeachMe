class Schedule < ApplicationRecord
  belongs_to :teacher

  def self.schedules_by_teacher(current_teacher)
    @schedule_teacher = Schedule.where(teacher: current_teacher)
  end
end
