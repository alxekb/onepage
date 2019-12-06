class HomeController < ApplicationController
  def index; end

  def calc
    byebug
    CalcService.new(params[:a], params[:b], params[:commit]).call
  end
end
