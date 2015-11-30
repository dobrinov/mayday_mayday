class MeasurementsController < ApplicationController
  def index
    @metrics = Metric.where(layer: params[:layer])
    @measurements = Measurement.where('created_at > ?', Time.now - 1.hour)
                               .where(layer: params[:layer], name: params[:name])
                               .order(created_at: :asc)

    if params[:chart]
      @series = @measurements.group_by(&:host)
    else
      @measurements = @measurements.page(params[:page])
    end
  end
end
