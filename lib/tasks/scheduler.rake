task :send_mail_action => :environment do
	require 'message_actions_sender'

    puts "Mailing Messages..."
	MessageActionsSender.new.mailQueued
    puts "done."
end