class StudiesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @studies = Study.all
  end

  def new
    @study = Study.new
  end

  def create

    @study = Study.new
    @study.name = params[:study][:name]
    @study.description = params[:study][:description]
    @study.description = params[:study][:study_type]
    @study.description = params[:study][:duration_in_days]

    @study.save
    redirect_to study_path(@study)
  end



  def show
    @study = Study.find(params[:id])
  end
end
