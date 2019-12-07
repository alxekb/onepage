class CalcChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'calc'
  end

  def send_message(payload)

  end
end