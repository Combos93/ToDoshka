class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'olesya', password: 'arch'
end
