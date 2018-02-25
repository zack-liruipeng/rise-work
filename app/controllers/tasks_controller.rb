class TasksController < ApplicationController
  before_filter :authenticate_user!
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
    @task.user_id = current_user.id
  end

  def create
    @task = Task.new
    @task.name = params[:task][:name]
    @task.strategy_id = params[:task][:strategy_id]
    @task.user_id = current_user.id
    @task.description = params[:task][:strategy_description]
    @task.name = params[:task][:name]
    @task.when = params[:task][:strategy_when]
    @task.where = params[:task][:strategy_where]
    @task.what = params[:task][:strategy_what]
    @task.task_type = params[:task][:strategy_task_type]
    @task.activity_amount = params[:task][:strategy_amount]
    @task.barriers = params[:task][:strategy_barriers]
    current_user.tasks <<  @task
    @task.ppv = 1;
    current_user.ppv = current_user.ppv + @task.ppv

    @task.save
    redirect_to :back, :notice => "Activity Added."


  end

  def update

    @task = Task.find(params[:id])
    @task.user_id = current_user.id
    current_user.tasks <<  @task
    @task.update_attributes(params[:task])

    @task.ppv = @task.ppv + 1;
    current_user.ppv = current_user.ppv + @task.ppv

    redirect_to :back , :notice => "Activity updated."

  end


  def show
    authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    @tasks = @user.tasks.order('id ASC')


    respond_to do |format|
      format.xml

    end

  end


  def destroy

    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back , :notice => "Activity Deleted."
  end
end
