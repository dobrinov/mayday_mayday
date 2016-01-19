module Alerting
  class PoliciesController < ApplicationController
    def index
      @policies = Policy.all
    end

    def new
      @policy = Policy.new
    end

    def create
      @policy = Policy.new(policy_params)

      if @policy.save
        redirect_to alerting_policies_path
      else
        render :new
      end
    end

    def show
    end

    def edit
      @policy = Policy.find(params[:id])
    end

    def update
      @policy = Policy.find(params[:id])

      if @policy.update_attributes(policy_params)
        redirect_to alerting_policies_path
      else
        render :edit
      end
    end

    def destroy
      policy = Policy.find(params[:id])
      policy.destroy

      redirect_to alerting_policies_path
    end

    private

    def policy_params
      if params[:policy].present?
        params[:policy].permit(:name, :description)
      else
        {}
      end
    end
  end
end
