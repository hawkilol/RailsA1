class ApplicationController < ActionController::Base
  helper_method :current_user
  
  #before_action :configure_permitted_parameters, if: :devise_controller?
  

	#protect_from_forgery with: :exception
	#before_action :authenticate_user!
	#before_action :configure_permitted_parameters, if: :devise_controller?
  def self.render_with_signed_in_user(*args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(:current_user, scope: :current_user, run_callbacks: false) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end




=begin
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


    

    def self.renderer_with_signed_in_user()
    config.renderer_for_connection_proc = ->(websocket_connection) do
    	ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'


   		 proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap do |proxy|
     		proxy.set_user(
        		websocket_connection.current_user,
        		scope: :user,
       			run_callbacks: false
            )
        renderer = self.renderer.new('warden' => proxy)
        renderer.render('messages/message', locals: {message: message})

        ApplicationController.renderer.new(
          websocket_connection.env.slice(
             Rack::HTTP_COOKIE,
            Rack::RACK_SESSION,
          ).merge('warden' => proxy)
        )
     	end
    end

=end

    
    




    
    

    




    


    
=begin
  config.renderer_for_connection_proc = ->(websocket_connection) do
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'

    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap do |proxy|
      proxy.set_user(
        websocket_connection.current_user,
        scope: :user,
        run_callbacks: false
      )
    end

    ApplicationController.renderer.new(
      websocket_connection.env.slice(
        Rack::HTTP_COOKIE,
        Rack::RACK_SESSION,
      ).merge('warden' => proxy)
    )
  end

end
=end


end
