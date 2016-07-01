class CyclesController < ApplicationController
  before_action :set_cycle, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:edit, :new, :show]
  before_filter :basic, only: [:show, :new, :edit, :create, :update, :destroy]
skip_before_filter :verify_authenticity_token
  respond_to :html

  def index
    @cycles = Cycle.all.order(:category_id, :priority, time: "desc")
    @cycles_time_sum = Cycle.sum(:time)
    @cycles_sum_per_category = Cycle.find_by_sql("SELECT category_id, SEC_TO_TIME( SUM( TIME_TO_SEC(time ) ) ) as sum_time FROM cycles group by category_id")
  #  raise @cycles_sum_per_category.inspect
    respond_with(@cycles)
  end

  def show
    respond_with(@cycle)
  end

  def new
    @cycle = Cycle.new
    respond_with(@cycle)
  end

  def edit
  end

  def create
    @cycle = Cycle.new(cycle_params)
    @cycle.save
    respond_with(@cycle)
  end

  def update
    @cycle.update(cycle_params)
    redirect_to :action => "index"
  end

  def destroy
    @cycle.destroy
    respond_with(@cycle)
  end

  private
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def cycle_params
      params.require(:cycle).permit(:priority, :title, :content, :time, :category_id)
    end
end
