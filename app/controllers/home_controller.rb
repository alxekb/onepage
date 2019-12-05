class HomeController < ApplicationController
  def index
    @calc
  end

  def calc
    a, b, cmd = params[:a], params[:b], params[:commit]
    puts a,b,cmd
  end
end
