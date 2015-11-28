class Metric
  def self.all
    Measurement.select(:layer, :name).distinct.order(layer: :desc)
  end

  def self.where(*args)
    Measurement.where(*args).select(:layer, :name).distinct.order(layer: :desc)
  end

  def self.layers
    Measurement.select(:layer).distinct.map(&:layer)
  end
end
