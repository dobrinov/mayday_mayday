class MeasurementsController < ApplicationController
  def index
    @metrics = Metric.where(layer: params[:layer])
    @measurements = Measurement.where(layer: params[:layer], name: params[:name]).page(params[:page])
  end
end
