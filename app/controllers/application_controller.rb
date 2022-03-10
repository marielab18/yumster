class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end

def default_url_options
  { host: ENV["http://www.goyumster.xyz"] || "localhost:3000" }
end
