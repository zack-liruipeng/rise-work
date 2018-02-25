class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, message: 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    authorize! :show, @user, message: 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    @activity_dates = []

    @user.activities.each do |activity|
      next unless @activity_dates.include?(activity.created_at.to_date) == false
      @activity_dates << activity.created_at.to_date
    end

    @complete_SS = 0
    @complete_Routes = 0
    @complete_AP = 0

    @user.tasks.each do |task|
      next unless task.completed == true
      if task.task_type == 'support'
        @complete_SS += 1
      elsif task.task_type == 'route'

        @complete_Routes += 1
      elsif task.task_type = 'userdefined'
        @complete_AP += 1

      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml
    end
  end

  # authorize! :update, @user, :message => 'Not authorized as an administrator.'
  # i added a comment

  def update
    @user = User.find(params[:id])
    params[:user][:secret_key] = @user.organization.secret_key
    @user.email_alerts = params[:user][:email_alerts]
    if params[:user_role] != nil
      @user.role_ids = params[:user_role]
    end
    if @user.update_attributes(params[:user])
      @user.save
      redirect_to root_path, notice: 'User updated.'
    else
      redirect_to root_path, alert: 'Unable to update user.'
      Rails.logger.info(@user.errors.messages.inspect)
    end
  end

  def destroy
    authorize! :destroy, @user, message: 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, notice: 'User deleted.'
    else
      redirect_to users_path, notice: "Can't delete yourself."
    end
  end
end
