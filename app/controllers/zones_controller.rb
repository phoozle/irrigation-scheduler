class ZonesController < ApplicationController
  def index
    @zones = Zone.all
  end

  def new
    @zone = Zone.new(name: "Zone #{rand(99)}")
  end

  def create
    @zone = Zone.new(zone_params)

    if @zone.save == true
      redirect_to zones_path, notice: "Successfully created zone!"
    else
      flash[:error] = "Validation errors happened!"
      render :new
    end
  end

  def edit
    @zone = Zone.find(params[:id])
  end

  def update
    @zone = Zone.find(params[:id])

    if @zone.update(zone_params)
      redirect_to zones_path, notice: "Successfully updated"
    else
      flash[:error] = @zone.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @zone = Zone.find(params[:id])
    @zone.destroy
    redirect_to zones_path, notice: "Successfully deleted #{@zone.name}"
  end

  private

  def zone_params
    params["zone"].permit(:name, :on_url, :off_url)
  end
end
