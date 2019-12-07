# frozen_string_literal: true

class CalcService < AbstractService
  attr_accessor :cmd, :params, :result, :status, :errors

  COMMANDS = %w[+ - / *].freeze

  def initialize(cmd, params)
    @cmd = cmd
    @params = params
    @status = :error
    @errors = {}
    @result = nil
  end

  def call
    process_data if CalcService::COMMANDS.include? @cmd
    assign_errors if @result.nil?
    @status = :success if @errors.blank?

    self
  end

  def success?
    @status == :success
  end

  def process_data
    a, b = assign_params
    @result = case @cmd
      when CalcService::COMMANDS[0]
        a + b
      when CalcService::COMMANDS[1]
        a - b
      when CalcService::COMMANDS[2]
        a / b
      when CalcService::COMMANDS[3]
        a * b
      else
        nil
      end
  end

  private

  def assign_errors
    @errors[:process] = 'bad request'
  end

  def assign_params
    a = @params[:a]
    b = @params[:b]
    return a, b
  end
end
