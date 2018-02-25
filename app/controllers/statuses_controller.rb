class StatusesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create

    @status = Status.new
    @status.name = params[:status][:name]
    @status.description = params[:status][:description]

    @status.save
    redirect_to phase_path(@status)
  end



  def show
    @status = Status.find(params[:id])
  end
end
