class TeachersBackoffice::ScheduleController < TeachersBackofficeController
    before_action :set_teachers_schedule, only: [ :edit, :update, :destroy ]


  def index
    @schedule = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
  end

  def edit
  end

  def update
  end


  def destroy
    @schedule.destroy
  end

  private
  
    def schedule_params
      params.require(:schedule).permit(:teacher_id, :subject, :time_from, :time_to, :day)
    end

    def set_teachers_schedule
      @schedule = Schedule.find(params[:id])
    end
end
