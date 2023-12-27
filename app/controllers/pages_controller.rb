class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :materials, :sustainability ]

  def home

  end

  def materials

  end

  def sustainability

  end
end
