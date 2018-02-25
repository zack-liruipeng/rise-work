class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!
  def create

    @organization = nil

    if (params[:user][:organization_id].empty? == false && params[:user][:secret_key].empty? == false)

      @organization = Organization.find(params[:user][:organization_id])
      if (@organization.secret_key != params[:user][:secret_key])
        #   flash[:user] = "The Study ID Key you have entered is incorrect.  Please enter a correct key to continue."
        params[:user][:secret_key] = ""
        params[:user][:organization_id] = ""
      end
    elsif (params[:user][:organization_id].empty? || params[:user][:secret_key].empty?)

      params[:user][:secret_key] = ""
      params[:user][:organization_id] = ""


    end

    super

    this_user = User.find_by_email(params[:user][:email])

    if ((@organization.nil? == false) && (this_user.nil? == false))

      this_user.organization = @organization
      this_user.save

      @organization.users << this_user
      @organization.save

    end

  end



end
