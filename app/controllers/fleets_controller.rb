class FleetsController < ApplicationController

  def show
    @fleet = Fleet.find(params[:id])
  end

  def new
    @fleet = Fleet.new
  end

  def create
    @fleet = Fleet.new(fleet_params)

    if @fleet.save
      redirect_to @fleet
      # redirect_to fleet_url(@fleet.id)
      #przekierowanie do akcji show
    else
      redirect_to :new
      #przekierowanie do akcji new w tym samym controllerze
    end
  end

  def edit
    @fleet = Fleet.find(params[:id])
  end

  def update
    if @fleet.update(fleet_params)
      reditect_to @fleet
    else
      redirect_to :edit
    end
  end

  def destroy
    @fleet.destroy
    redirect_to :new
  end

  private

  def fleet_params
    params
      .require(:fleet)
      .permit(:lm, :cm, :kr, :ow, :panc, :ni)
      .merge(user_id: session[:user_id])
  end
end
