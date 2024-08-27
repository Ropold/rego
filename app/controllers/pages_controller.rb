class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @lego_sets = LegoSet.all
  end
end
