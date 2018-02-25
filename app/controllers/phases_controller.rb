class PhasesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @phases = Phase.all
  end

  def new
    @phase = Phase.new
  end

  def create

    @phase = Phase.new
    @phase.name = params[:phase][:name]
    @phase.description = params[:phase][:description]
    @phase.order_id = params[:phase][:order_id]
    @phase.duration_in_days = params[:phase][:duration_in_days]
    @phase.start_on_day_of_study = params[:phase][:start_on_day_of_study]
    @phase.finish_on_day_of_study = params[:phase][:finish_on_day_of_study]
    @phase.phase_baseline_percent_increase = params[:phase][:phase_baseline_percent_increase]

    @phase.save
    redirect_to phase_path(@phase)
  end



  def show
    @phase = Phase.find(params[:id])
  end
end
