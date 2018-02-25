class OrganizationsController < ApplicationController

  #before_filter :authenticate_user! (lets us test without accounts, it's easier that way, but should be uncommented in production)
  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new
    @organization.name = params[:organization][:name]
    @organization.organization_type = params[:organization][:organization_type]
    @organization.address = params[:organization][:address]
    @organization.city = params[:organization][:city]
    @organization.province = params[:organization][:province]
    @organization.country = params[:organization][:country]
    @organization.postal_code = params[:organization][:postal_code]
    @organization.time_zone = params[:organization][:time_zone]
    @organization.licenses = params[:organization][:licenses]
    @organization.note = params[:organization][:note]
    @organization.secret_key = params[:organization][:secret_key]
    @organization.save
    redirect_to '/organizations', notice: 'Organization created.'
  end


  def update
    @organization = Organization.find(params[:id])
    @organization.name = params[:organization][:name]
    @organization.licenses = params[:organization][:licenses]
    @organization.secret_key = params[:organization][:secret_key]
    @organization.note = params[:organization][:note]
    @organization.save
    redirect_to '/organizations', notice: 'Organization updated.'
  end

  def show
    @organization = Organization.find(params[:id])
    @users = User.where("organization_id = ?",params[:id])
  end

  def getdata
    @organization = Organization.find(params[:organization_id])
    @users = User.where("organization_id = ?",params[:organization_id])

    excel = Axlsx::Package.new
    book = excel.workbook

    allDates = Array.new
    @users.each do |user|
      user.activities.all.each do |activity|
        allDates.push(activity.activity_date)
      end
    end
    unless allDates.empty?
      dates = ((allDates.min)..allDates.max).to_a

      dates.unshift("") # add whitespace for name column
      book.add_worksheet(:name => "Activities") do |sheet|
        sheet.add_row(dates)
        @users.each do |user|
          row = Array.new(dates.size)
          row[0] = user.name
          #TODO optimize to only use dates within the range
          user.activities.all.sort_by(&:activity_date).each do |activity|
            index = dates.index{ |date| date==activity.activity_date }
            if index!=nil
              row[index] = activity.amount
            end
          end
          sheet.add_row(row)
        end
      end
    end
    questions = SurveyQuestion.where("question IS NOT NULL")
    questionNames = Array.new(questions.size)
    questions.each_with_index do |question, index|
      questionNames[index]=question.question
    end

    questionNames.unshift("") # add whitespace for name column

    book.add_worksheet(:name => "Survey Responses") do |sheet|
      sheet.add_row(questionNames)
      @users.each do |user|
        row = Array.new(questionNames.size)
        row[0] = user.name
        responces = UserSurveyResponce.where("user_id = ?", user.id)
        responces.each do |responce|
          index = questions.index{ |question| question.id==responce.survey_question_id }
          if index!=nil
            row[index+1] = responce.question_responce
          end
        end
        sheet.add_row(row)
      end
    end

    send_data excel.to_stream.read, type: "application/xlsx", filename: @organization.name+" "+Date.today.to_s+".xlsx"

  end
end
