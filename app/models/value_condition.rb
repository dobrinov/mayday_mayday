class ValueCondition < Condition
  def measurements
    Measurement.where(layer: layer, name: name).order(created_at: :asc)
  end

  def current_measurement
    measurements.last
  end

  def violated?
    return false unless current_measurement.present?

    if inverted?
      current_measurement.value < value
    else
      current_measurement.value > value
    end
  end
end
