xml.instruct!
xml.strageties_achievements do
xml.user_email @user.email
      xml.strategies do
       @user.tasks.order('id ASC').each do |task|
        xml.target! << task.to_xml(skip_instruct: true)
        end
        end
xml.achievements do
       @user.achievements.order('id ASC').each do |achievement|

        xml.target! << achievement.to_xml(skip_instruct: true)

 
        end
end
  end


