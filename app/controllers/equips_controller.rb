class EquipsController < ApplicationController
  before_action :set_equip, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @equips = Equip.where(status: 0)
    @equips_all = Equip.where('status = 9').order('status asc').order('date')
    @equips_not_zero = Equip.where('status not in (0, 9, 8) ').order('date')
    @equips_price_sum = Equip.where(status: 0).sum(:price)
    @equips_price_sum_not_zero = Equip.where('status not in (0, 9, 8) ').sum(:price)
    @equips_price_sum_all = Equip.where('status = 9').sum(:price)
    respond_with(@equips)
  end

  def show
    respond_with(@equip)
  end

  def new
    @equip = Equip.new
    respond_with(@equip)
  end

  def edit
  end

  def create
    @equip = Equip.new(equip_params)
    @equip.save
    respond_with(@equip)
  end

  def update
    @equip.update(equip_params)
    respond_with(@equip)
  end

  def destroy
    @equip.destroy
    respond_with(@equip)
  end

  private
    def set_equip
      @equip = Equip.find(params[:id])
    end

    def equip_params
      params.require(:equip).permit(:name, :detail, :date, :status, :priority, :bland, :price, :image_link, :pr_link, :image, :genre_ids => [])
    end
end
