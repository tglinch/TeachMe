class TeachersBackoffice::WelcomeController < TeachersBackofficeController
  def index
    @schedule_teacher = Schedule.find_or_create_by(teacher: current_teacher)
  end
end
