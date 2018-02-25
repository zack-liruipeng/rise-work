class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.json
  before_filter :authenticate_user!
  def index


    @user_phase = current_user.user_phases.find_by_id(current_user.user_studies.find_by_study_id(1).current_user_phase)
    @actual_phase = @user_phase.phase


    if (current_user_study.baseline_survey_responceset_id.nil? == false) && (@user_phase.next_user_phase.nil? == false)

      @responce_baseline_responce_set = UserSurveyResponceSet.find(current_user_study.baseline_survey_responceset_id)

    elsif (current_user_study.followup_survey_responceset_id.nil? == false) && (@user_phase.next_user_phase.nil? == true)
      @responce_baseline_responce_set = UserSurveyResponceSet.find(current_user_study.followup_survey_responceset_id)

    else

      @responce_baseline_responce_set = UserSurveyResponceSet.new

      #to do at org support
      @responce_baseline_responce_set.user = current_user
      @responce_baseline_responce_set.survey = Survey.find_by_name(@actual_phase.name)



      @responce_baseline_responce_set.current_question_id = @responce_baseline_responce_set.survey.survey_questions.order('id ASC').first.id
      @responce_baseline_responce_set.save

      if (current_user_study.baseline_survey_responceset_id.nil? == true)

        current_user_study.baseline_survey_responceset_id = @responce_baseline_responce_set.id

      else (current_user_study.followup_survey_responceset_id.nil? == true)
        current_user_study.followup_survey_responceset_id = @responce_baseline_responce_set.id

      end

      current_user_study.save
    end

    redirect_to '/survey'


    #@surveys = Survey.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @surveys }
    # end
  end


  def show
    authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @responce_baseline_responce_set = UserSurveyResponceSet.find(params[:id])

    @survey_responces = @responce_baseline_responce_set.user_survey_responces.order('id ASC')

    # @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml
      format.json {

        render :json => @responce_baseline_responce_set.to_json(
          :only => {:id=>{}},
          :include => {
            :survey => {:only => :title},
            :user => {:only => :email},
            :user_survey_responces => { :only => [:question_responce],
                                        :include => [:survey_question => { :only => [:question]}]}})}





    end
  end


  # GET /surveys/1
  # GET /surveys/1.json
end
