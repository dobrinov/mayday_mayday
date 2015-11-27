class MeasurementsController < ApplicationController
  def index
    @measurements = Measurement.where(layer: params[:layer], name: params[:name])
  end
end
