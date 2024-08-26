class LegoSetsController < ApplicationController
  def index
    @legos = LegoSet.all
  end

  def new
  end

  def create
  end
end
