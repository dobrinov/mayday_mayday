class Metric
  def self.all
    Measurement.select(:layer, :name).distinct.order(layer: :desc)
  end
end
