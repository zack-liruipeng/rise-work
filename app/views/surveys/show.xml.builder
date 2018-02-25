xml.instruct!
xml.responce_set do
      xml.user_email @responce_baseline_responce_set.user.email
      xml.survey_title @responce_baseline_responce_set.survey.title
      xml.responce_set_id @responce_baseline_responce_set.id
      xml.responces do
       @responce_baseline_responce_set.user_survey_responces.order('id ASC').each do |responce|
        xml.survey_question do
            xml.id responce.survey_question.id
            xml.type responce.survey_question.question_type
            xml.question responce.survey_question.question
            xml.responce responce.question_responce 
        end
        end
      end

end

