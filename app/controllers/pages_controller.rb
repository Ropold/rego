class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @lego_sets = LegoSet.search_by_set_name_and_lego_nr(params[:query])
    else
      @lego_sets = LegoSet.all
    end
  end
end
