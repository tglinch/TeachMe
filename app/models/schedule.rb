class Schedule < ApplicationRecord
  belongs_to :teacher

  def self.schedule_teacher(schedule, current_teacher)
    if !!current_user
      @schedule_teacher = Schedule.all.find_or_create_by(schedule: current_teacher)
      schedule - Schedule.all
    end
  end
end
