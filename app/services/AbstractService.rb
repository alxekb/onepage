# frozen_string_literal: true

class AbstractService
  def self.call(*args)
    instance = new(*args)
    instance.call
    instance
  end

  def call
    raise NotImplementedError, "Don't instantiate AbstractService, please, work with descendants"
  end
end
