class StrategiesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @strategies = Strategy.all
  end

  def new
    @strategy = Strategy.new
  end

  def create
    @strategy = Strategy.new
    @strategy.name = params[:strategy][:name]
    @strategy.strategy_type = params[:strategy][:strategy_type]
    @strategy.strategy_subtype = params[:strategy][:strategy_subtype]
    @strategy.map_url = params[:strategy][:map_url]
    @strategy.map_image_url = "/images/general/dal/default.png"
    @strategy.content = '<div class="row-fluid"><div class="span6"><p>'+ params[:strategy][:content]+'</p></div><div class="span6"><table id="datatable_example" class="responsive table table-striped table-bordered" style="width:100%;margin-bottom:0; ">'+
      '<thead> <tr> <th class="">Details:</th> </tr> </thead> <tbody> '+
      '<tr> <td>'+params[:steps]+' steps</td> </tr> <tr>'+
      ' <td>'+params[:time]+' minutes</td>'+
      ' </tr><tr> <td>'+params[:distance]+' km</td> </tr></tbody></table></div></div>'
    @strategy.save

    for i in 3..6
      @phase = Phase.find(i)
      @phase.strategies << @strategy
    end


    redirect_to '/strategies', notice: 'Strategy created.'
  end


  def show
    @strategy = Strategy.find(params[:id])
  end

  def destroy
    authorize! :destroy, @strategy, message: 'Not authorized as an administrator.'
    strategy = Strategy.find(params[:id])
    strategy.destroy
    redirect_to '/strategies', notice: 'Strategy deleted.'

  end
end
