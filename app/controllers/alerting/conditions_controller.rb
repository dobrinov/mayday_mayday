module Alerting
  class ConditionsController < ApplicationController
    before_action :validate_type

    def new
      @policy = Policy.find(params[:policy_id])
      @condition = Condition.new
    end

    def create
      @policy = Policy.find(params[:policy_id])
      @condition = @policy.conditions.build(condition_params)

      if @condition.save
        redirect_to alerting_policies_path
      else
        render :new
      end
    end

    def edit
      # Skip for now
    end

    def update
      # Skip for now
    end

    def destroy
      @condition = Condition.find(params[:id])
      @condition.destroy!

      redirect_to alerting_policies_path
    end

    private

    def validate_type
      unless Condition::TYPES.map(&:to_s).include? params[:type]
        params[:type] = Condition::TYPES.first.to_s
      end
    end

    def condition_params
      if params[:condition].present?
        params[:condition].permit(:layer, :name, :type, :value, :percentile, :inverted)
      else
        {}
      end
    end
  end
end
