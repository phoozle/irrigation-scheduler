class SchedulesController < ApplicationController
  TIME_OPTIONS_STEP_MINUTES = 30

  def index
    @zone = Zone.find(params[:zone_id])
    @schedules = @zone.schedules.decorate
  end

  def new
    @zone = Zone.find(params[:zone_id])
    @schedule = Schedule.new
    @time_options = time_options
  end

  def create
    @zone = Zone.find(params[:zone_id])
    @schedule = @zone.schedules.new(schedule_params)

    if @schedule.save
      redirect_to zone_schedules_path(@schedule.zone), notice: "Successfully added schedule"
    else
      @time_options = time_options
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @time_options = time_options
  end

  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params)
      redirect_to zone_schedules_path(@schedule.zone), notice: "Successfully updated schedule"
    else
      @time_options = time_options
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to zone_schedules_path(@schedule.zone), notice: "Successfully removed schedule"
  end

  private

  def schedule_params
    params.require(:schedule).permit(:duration_minutes, :rain_skip, :temperature_threshold, days: [], times: []).tap do |schedule_params|
      # Ensure no NULL times
      schedule_params[:times].select!(&:present?)
    end
  end

  def time_options
    ((24 * 60) / TIME_OPTIONS_STEP_MINUTES).times.each_with_object([]) do |i, options|
      time = Time.parse("12:00am") + (i * TIME_OPTIONS_STEP_MINUTES).minutes
      options << time.strftime("%I:%M %p")
      options
    end
  end
end
