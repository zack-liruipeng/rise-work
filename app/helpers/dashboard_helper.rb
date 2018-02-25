module DashboardHelper

 def activity_resource_name
    :activity
  end

  def activity_resource
	@activity_resource ||= Activity.new

  end

end
