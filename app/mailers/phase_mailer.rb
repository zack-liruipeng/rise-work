class PhaseMailer < ActionMailer::Base
#	default from: "riseatwork@utoronto.ca"
	default from: "rise@dal.ca"

	def phase_email(user,user_phase,message_action)
		@user = user
		@user_phase  = user_phase
		@message_action = message_action
		mail(:to => user.email, :subject =>  "#{@message_action.subject}")
	end
	
end
