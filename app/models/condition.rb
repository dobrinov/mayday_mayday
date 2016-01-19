class Condition < ActiveRecord::Base
  belongs_to :policy

  TYPES = [
            ValueCondition,
            PercentileCondition,
            ExpirationCondition,
            ExistanceCondition
          ]

  def measurements
    raise "Not implemented"
  end

  def current_measurement
    raise "Not implemented"
  end

  def violated?
    raise "Not implemented"
  end
end
