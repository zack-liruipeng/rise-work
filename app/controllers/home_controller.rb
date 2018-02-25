class HomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  def index
    @users = User.all

    @activities = Activity.all

    @who_we_are = Article.find_by_id(1)
    @what_do_we_do = Article.find_by_id(2)
    @why_join_us = Article.find_by_id(3)
    @our_partners = Article.find_by_id(4)
    @help = Article.find_by_id(5)
    @about_us = Article.find_by_id(6)
    @home_dashboard = HomeDashboard.find(1)

    @eua = Article.find_by_name('EUA')

    @home_dashboard.people_walking = @users.count
    total_steps_taken = 0
    @StepsDaily = 0
    @WalkingDistanceDaily = 0

    @AchivementCount = Achievement.all.count

    @activities.each_with_index do |activity, _index|
      total_steps_taken += activity.amount if activity.amount
    end

    if @users.count > 0

      dailysteps = (total_steps_taken / @users.count)

      @StepsDaily = number_to_human(dailysteps, precision: 2, units: { unit: '', thousand: 'K', million: 'M' })

      @WalkingDistanceDaily = (dailysteps / 1250)
      @WalkingDistanceWeekly = (dailysteps / 1250) * 7
    end

    @Ttotal_steps_taken = number_to_human(total_steps_taken, precision: 2, units: { unit: '', thousand: 'K', million: 'M' })

    @home_dashboard.total_days_of_activity = @activities.count
  end
end
