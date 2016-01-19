module Alerting
  class IncidentsController < ApplicationController
    def index
      @incidents = Incident.all#.where(resolved_at: nil)
    end
  end
end
