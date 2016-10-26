class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper NavHighlighter::Engine.helpers
  extend NavHighlighter::NavHighlighting
end
