class MetricsController < ApplicationController
  def index
    redirect_to metrics_layer_path(layer: 'physical') if params[:layer].nil?

    @metrics = Metric.where(layer: params[:layer])
  end
end
