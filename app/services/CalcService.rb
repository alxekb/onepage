# frozen_string_literal: true

class CalcService < AbstractService
  attr_accessor :cmd, :user, :params, :result, :status, :errors, :record

  COMMANDS = %w[+ - / *].freeze

  def initialize(user, command)
    @user = user
    @command = command
    @status = :error
    @errors = {}
    @result = nil
    @record = nil
  end

  def call
    process_data if CalcService::COMMANDS.include? @command[:cmd]
    create_record
    process_errors

    self
  end

  def success?
    @status == :success
  end

  private

  def process_data
    a, b, cmd = assign_params(@command)
    @result = case cmd
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

  def create_record
    if @errors.blank? && @result.present?
      record = Record.new(user_id: @user.id,
                          result: @result.to_s,
                          a: @command[:a].to_i,
                          b: @command[:b].to_i,
                          cmd: @command[:cmd].to_s)

      if record.valid?
        record.save!
        @record = record.id
      else
        @errors[:record] = record.errors.messages
      end
    end
  end

  def process_errors
    if @result.nil? || @errors.present?
      @errors[:process] = 'Equation result is nil of error.'
    else
      @status = :success
    end
  end

  def assign_params(command)
    a = command[:a].to_i
    b = command[:b].to_i
    cmd = command[:cmd].to_s
    [a, b, cmd]
  end
end
