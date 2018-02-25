class UserSurveyResponcesController < ApplicationController
  # GET /survey_questions
  # GET /survey_questions.json
  before_filter :authenticate_user!
  def index

    if current_user_study.baseline_survey_responceset_id != nil

      @responce_set = UserSurveyResponceSet.find(current_user_study.baseline_survey_responceset_id)

      if (@responce_set.completed)
        @responce_set = UserSurveyResponceSet.find(current_user_study.followup_survey_responceset_id)
      end

      @current_question = SurveyQuestion.find_by_id(@responce_set.current_question_id)

      @responce = UserSurveyResponce.new

      current_user.user_survey_responces.each do |responce|

        if (responce.survey_question.id == @current_question.id)

          @responce = responce

        end
      end


    end

  end


  def show

    @responce = UserSurveyResponce.find(params[:id])


    @current_question = SurveyQuestion.find_by_id(@responce.survey_question_id)

  end


  def new
    @responce = UserSurveyResponce.new

  end

  def edit
    @responce = UserSurveyResponce.find(params[:id])


    @current_question = SurveyQuestion.find_by_id(@responce.survey_question_id)

  end

  # POST /survey_questions.json

  def create
    @responce = UserSurveyResponce.find_or_create_by_id(params[:user_survey_responce][:responce_id])
    @responce_set = UserSurveyResponceSet.find(current_user_study.baseline_survey_responceset_id)

    if (@responce_set.completed == true)
      @responce_set = UserSurveyResponceSet.find(current_user_study.followup_survey_responceset_id)
    end






    if params[:back_button].nil? == false
      @responce_set.current_question_id = SurveyQuestion.find_by_id(params[:user_survey_responce][:question_id]).previous_question_id
      @responce_set.save
      #@responce_set.user_survesdasfsdfsdf334y_responces <<  @responce
      return redirect_to '/surveys'
    elsif params[:edit_button].nil? == false
      @responce_set.current_question_id = SurveyQuestion.find_by_id(params[:user_survey_responce][:question_id]).id
      @responce.update_attribute(:completed, false)
      @responce.save
      @responce_set.save
      return redirect_to '/surveys'
    end

    if params[:complete_next_button].nil? == false
      #@responce_set.user_survesdasfsdfsdf334y_responces <<  @responce
      @responce_set.current_question_id = SurveyQuestion.find_by_id(@responce.survey_question_id).next_question_id
      @responce_set.save
      return redirect_to '/surveys'
    end



    @responce.survey_question_id = params[:user_survey_responce][:question_id]
    @current_question = SurveyQuestion.find_by_id(@responce.survey_question_id)


    @responce.question_responce = params[:user_survey_responce][:question_responce]

    if params[:user_survey_responce][:question_responce_weight]

      @responce.question_responce = params[:user_survey_responce][:question_responce_weight] + params[:user_survey_responce][:question_responce_units]

    end

    if params[:user_survey_responce][:question_responce_height]

      @responce.question_responce = params[:user_survey_responce][:question_responce_height] + params[:user_survey_responce][:question_responce_units]

    end


    #return redirect_to '/surveys' , :alert => "You have already logged steps for the day."


    if ((params[:user_survey_responce][:question_responce_skipped] == '1'))

      @responce.question_responce = 'None'

    end

    if (params[:skip_button])

      @responce.question_responce = 'Question Skipped'

    end

    @responce.question_responce = @responce.question_responce.to_s.humanize

    if (@responce.question_responce !='[""]') && (@responce.question_responce !='""') && (@responce.question_responce !='--- ''') && (@responce.question_responce.empty? == false)
      @responce.completed = true;
    else
      @responce.update_attribute(:completed, false)
    end
    @responce.user_id = current_user.id
    current_user.user_survey_responces <<  @responce


    @responce.save


    if (@responce_set.completed)
      @responce_set = UserSurveyResponceSet.find(current_user_study.followup_survey_responceset_id)
    end




    if params[:user_survey_responce][:question_responce_skipped] == '1'

      @responce_set.current_question_id = SurveyQuestion.find_by_id(@responce.survey_question_id).skip_to_question_id

    else

      @responce_set.current_question_id = SurveyQuestion.find_by_id(@responce.survey_question_id).next_question_id
    end

    #@responce_set.user_survesdasfsdfsdf334y_responces <<  @responce


    #@responce_set.user_survesdasfsdfsdf334y_responces <<  @responce

    if params[:next_button] && ((@responce.completed == false) || (@responce.id.nil? == true))

      redirect_to '/survey', :alert => "Please answer this question or press skip to proceed."

    elsif @responce_set.current_question_id
      @responce_set.save
      @responce_set.user_survey_responces <<  @responce
      redirect_to '/surveys'
    else
      @responce_set.completed = true;
      @responce_set.save
      @responce_set.user_survey_responces <<  @responce

      redirect_to '/dashboard' , :notice => "Survey Complete."
    end
  end



  # PUT /survey_questions/1
  # PUT /survey_questions/1.json
  def update


  end

  # DELETE /survey_questions/1
  # DELETE /survey_questions/1.json
  def destroy

  end
end
