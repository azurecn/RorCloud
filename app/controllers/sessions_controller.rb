require 'kuaipan'

class SessionsController < ApplicationController
  extend Kuaipan::OpenAPI

  consumer_token = "xcfMKQr1qQ130fZs"
  consumer_secret = "UpZPVEgFK5fHVUR7"
  input_config consumer_token, consumer_secret

  def connect
    extend Kuaipan::OpenAPI

    oauth_result_file = 'oauth_result.json'
    if File.exist?(oauth_result_file)
      File.open(oauth_result_file, 'r')do |f|
        oauth_result = JSON.parse(f.read)
        session[:k_session].set_atoken g_session_skip_oauth(
                                           oauth_result['oauth_token'],
                                           oauth_result['oauth_token_secret'],
                                           oauth_result['user_id'])

        @userinfo=session[:k_session].account_info['user_id']
      end
    else
      k_session = g_session :oauth_callback => "http://#{request.env["HTTP_HOST"]}/callback" # here get rtoken
      authorize_url = k_session[:authorize_url]
      session[:k_session] = k_session
      redirect_to authorize_url
    end
  end

  def view
    file = File.open(params[:file],'r')
    str = ''
    file.each do |line|
      str = line
    end
    startNum = str.index '{'
    length = str.length
    @info = JSON.parse(str[startNum-1,length - startNum + 1])

    file.close
  end

  def show
    path = '/home/azure/kuaipanfile'
    if Dir.exist? path

    else
      Dir.mkdir path
    end

    @dir = Dir['/home/azure/kuaipanfile/*']
  end

  def index

  end

  # folder = 'UploadData.exe'
  # file_name = '.kuaipan_test_file_123'
  # rename = 'renameFile'
  # copyname = 'copyfil.exe'
  # dir = 'demo_tiemei'
  def callback
    oauth_result_file = 'oauth_result.json'
    oauth_verifier = params[:oauth_verifier]
    oauth_result = session[:k_session].set_atoken oauth_verifier
    File.open(oauth_result_file,'w+')do |f|
      f.write(JSON.generate(oauth_result))
    end
    filename= 't1.dump'
    dir = '/home/azure/kuaipanfile'
    copyname='temp.demp'
    # file = File.open("/home/azure/t1.dump")
    # @info= session[:k_session].upload_file(file, {:path => "/#{ }" })['file_id']
    # @info = session[:k_session].download_file("/#{ filename }")do |res|
    #   Dir.mkdir(dir) unless Dir.exist?(dir)
    #   file = File.open("#{ dir }/#{ copyname }", 'wb')do |f|
    #     f.write(res.body)
    #     f.flush
    #   end
    # end
    @kp_files = session[:k_session].metadata("/#{  }")['files']
    for value in @kp_files do
      i = 0

       i=i+1
    end
    # @userinfo=session[:k_session].delete('/PobCloud')['msg']
    # session[:k_session].ownload_file("/#{ folder }/#{ copyname }")do |res|
    #   Dir.mkdir(dir) unless Dir.exist?(dir)
    #   file = File.open("#{ dir }/#{ copyname }", 'wb')do |f|
    #     f.write(res.body)
    #     f.flush
    #   end
    # end
    # redirect_to '/download'

    # @temp=2
  end

  def metadata
    @temp.account_info['user_id']
  end

  def download
    dir = '/home/azure/kuaipanfile'
    copyname = 'data.jpg'

     session[:k_session].download_file("/#{params[:name]}") do |res|
      Dir.mkdir(dir) unless Dir.exist?(dir)
      file = File.open("#{ dir }/#{ params[:name] }", 'wb')do |f|
        f.write(res.body)
        f.flush
      end
    end
  end

  def upload

  end
end