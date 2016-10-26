class UrlsController < ApplicationController
  nav_highlight do
    request.path.match %r{\A/(authors|books)/} do |m|
      m[1].to_sym
    end
  end

  def show
  end
end
