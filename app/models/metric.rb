class Metric
  attr_accessor :layer, :name

  def initialize(layer, name)
    @layer = layer
    @name = name
  end

  def self.all
    Measurement.select(:layer, :name)
               .distinct
               .order(layer: :desc)
               .map { |m| Metric.new(m.layer, m.name) }
  end

  def self.where(*args)
    Measurement.where(*args).select(:layer, :name).distinct.order(layer: :desc)
  end

  def self.layers
    Measurement.select(:layer).distinct.map(&:layer)
  end

  def self.names
    Measurement.select(:name).distinct.map(&:name)
  end

end
