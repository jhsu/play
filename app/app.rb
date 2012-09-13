require 'shellwords'
require 'fileutils'

require 'api/control'
require 'api/library'
require 'api/queue'
require 'api/system'

module Play
  class App < Sinatra::Base
    enable :sessions
    # set    :session_secret, Play.config.auth_token

    register Mustache::Sinatra
    # register Sinatra::Auth::Github

    dir = File.dirname(File.expand_path(__FILE__))

    # set :github_options, {
    #                     :secret    => Play.config.secret,
    #                     :client_id => Play.config.client_id,
    #                     :failure_app => Octobouncer,
    #                     :organization => Play.config.gh_org,
    #                     :github_scopes => 'user,offline_access'
    #                  }

    # Pusher
    Pusher.app_id =  Play.config.pusher_app_id
    Pusher.key = Play.config.pusher_key
    Pusher.secret = Play.config.pusher_secret

    set :public_folder, "#{dir}/frontend/public"
    set :static, true
    set :mustache, {
      :namespace => Play,
      :templates => "#{dir}/templates",
      :views => "#{dir}/views"
    }
    before do
      return if ENV['RACK_ENV'] == 'test'

      content_type :json

      session_not_required = request.path_info =~ /\/login/ ||
                             request.path_info =~ /\/auth/ ||
                             request.path_info =~ /\/images\/art\/.*.png/


      # if session_not_required || @current_user
        session_not_required || true
      # else
      #   login
      # end
    end

    def api_request
      !!params[:token] || !!request.env["HTTP_AUTHORIZATION"]
    end

    def login
      # halt 401 if !user

      # @current_user = session[:user] = user
    end

    def current_user
      @current_user
    end

    get "/" do
      content_type :html
      mustache :index
    end

    # get "/logout" do
    #   content_type :html
    #   logout!
    # end

    # get "/token" do
    #   @back_to = params[:redirect_to]

    #   content_type :html
    #   mustache :token, :layout => false
    # end
  end
end
