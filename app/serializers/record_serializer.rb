class RecordSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :a, :b, :cmd, :result
  attribute :formula do |record|
    RecordDecorator.new(record).formula
  end
end
