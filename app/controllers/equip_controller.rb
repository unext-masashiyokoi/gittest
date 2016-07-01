class EquipController < ApplicationController
  before_action :set_equip, only: [:show]
  respond_to :html

  def index
    @equips_all = Equip.where('status = 9').order('status asc').order('date')
    respond_with(@equips)
  end

  def show
    respond_with(@equip)
  end

  private
    def set_equip
      @equip = Equip.find(params[:id])
    end

end
