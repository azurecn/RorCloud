class StaticPagesController < ApplicationController

  def index
    enable :sessions

    extend Kuaipan::OpenAPI

    consumer_token = "xcfMKQr1qQ130fZs"
    consumer_secret = "UpZPVEgFK5fHVUR7"
    input_config consumer_token, consumer_secre

    oauth_verifier = params[:oauth_verifier]
    # parse oauth_verifier client code
    session[:k_session].set_atoken oauth_verifier # here set accesstoken
    redirect '/user_info'
  end

  def new

    enable :sessions

    extend Kuaipan::OpenAPI

    consumer_token = "xcfMKQr1qQ130fZs"
    consumer_secret = "UpZPVEgFK5fHVUR7"
    input_config consumer_token, consumer_secre
    
    oauth_verifier = params[:oauth_verifier]
    # parse oauth_verifier client code
    session[:k_session].set_atoken oauth_verifier # here set accesstoken
    redirect '/user_info'
  end

  def callback

  end

  def user_info
     html :index
  end

  get '/' do

  end
end
