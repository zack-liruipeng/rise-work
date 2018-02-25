class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_phase
  helper_method :current_user_study
  around_filter :user_time_zone, :if => :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => "Access Denied."
  end
  def after_sign_in_path_for(resource)
    '/dashboard'
  end
  #if current_user_study.baseline_survey_responceset_id.nil


  #<%= link_to 'Take Survey', '/surveys/kitchen-sink-survey', :method => :post %>

  #redirect_to '/surveys/kitchen-sink-survey'


  #end



  def user_time_zone(&block)
    Time.use_zone(current_user.organization.time_zone, &block)
  end

  private
  def current_user_phase
    @current_user_phase ||= current_user.user_phases.find_by_id(current_user.user_studies.find_by_study_id(1).current_user_phase)
  end

  def current_user_study
    @current_user_study ||= current_user.user_studies.find_by_study_id(1)
  end
end
