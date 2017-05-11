class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          @user.after_database_authentication
        else
          session["devise.oauth_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url(provider: true)
        end
      end
    }
  end

  Settings['providers'].each do |provider, _|
    provides_callback_for provider
  end
end
