class MeasurementsController < ApplicationController
  def index
    @metrics = Metric.where(layer: params[:layer])
    @measurements = Measurement.where('created_at > ?', Time.now - 1.hour)
                               .where(layer: params[:layer], name: params[:name]).page(params[:page])
  end
end
