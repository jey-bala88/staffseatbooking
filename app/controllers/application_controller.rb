class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  # This method will be used for send json output with data.
  def output_json_with_data(content={})
    render :json => {:http_status => 200, :data => content}
  end
end
