class RecordDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  def formula
    [object.a, object.cmd, object.b].join(' ')
  end

  def records_count
    object.user.records
          .where('a = ? AND b = ? AND cmd = ?', object.a, object.b, object.cmd)
          .count
  end

  def to_calc
    { formula: RecordDecorator.new(object).formula,
      result: object.result,
      id: object.id,
      count: RecordDecorator.new(object).records_count }
  end
end
