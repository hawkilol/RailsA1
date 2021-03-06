=begin
# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
class ApplicationController < ActionController::Base
	#protect_from_forgery with: :exception
	#before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	def self.render_with_signed_in_user(user, *args)
		ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
   		proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
   		renderer = self.renderer.new('warden' => proxy)
   		renderer.render(*args)
    end

    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end

=end