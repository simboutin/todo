class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  layout 'static'

  def home
  end
end
