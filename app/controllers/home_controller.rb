class HomeController < ApplicationController
  def index   
      session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/home/show')
      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"public_profile")  
      puts session.to_s + "<<< session"
      respond_to do |format|
          format.html {  }
      end
  end

  def show
      session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/home/show')
      if params[:code]
      # acknowledge code and get access token from FB
          session[:access_token] = session[:oauth].get_access_token(params[:code])
      end      
      # auth established, now do a graph call:
      @api = Koala::Facebook::API.new(session[:access_token])
      #@graph_data = @api.get_object("/me/statuses", "fields"=>"message")
      begin
          @profile = @api.get_object("/me")
          @friends =  @api.get_object("/me/friends")
      end
      respond_to do |format|
          format.html {   }        
      end
  end
end
