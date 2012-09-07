require 'api/control'
module Play
  class App < Sinatra::Base
    enable :sessions
    # set    :session_secret, Play.config.auth_token

    dir = File.dirname(File.expand_path(__FILE__))

    # set :github_options, {
    #                     :secret    => Play.config.secret,
    #                     :client_id => Play.config.client_id,
    #                     :failure_app => Octobouncer,
    #                     :organization => Play.config.gh_org,
    #                     :github_scopes => 'user,offline_access'
    #                  }

    # Pusher

    set :public_folder, "#{dir}/frontend/public"
    set :static, true
    # set :mustache, {
    #   :namespace => Play,
    #   :templates => "#{dir}/templates",
    #   :views => "#{dir}/views"
    # }
    before do
      content_type :json
    end

    get "/" do
      # mustache :index
    end

    # get "/logout" do
    #   content_type :html
    #   logout!
    #   redirect 'https://github.com'
    # end

    # get "/token" do
    #   @back_to = params[:redirect_to]

    #   content_type :html
    #   mustache :token, :layout => false
    # end
  end
end
