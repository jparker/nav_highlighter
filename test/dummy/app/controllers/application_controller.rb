class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  extend NavHighlighter::NavHighlighting
end
