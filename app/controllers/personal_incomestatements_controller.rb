class PersonalIncomestatementsController < ApplicationController
  before_filter :basic
  before_action :set_personal_incomestatement, only: [:show, :edit, :update, :destroy]
 
  respond_to :html

  def index
    @personal_incomestatements = PersonalIncomestatement.find_by_sql("select id, date, partner, car_loan, lower, credit, shopping_loan, yokoi_info, friend, family, health_care, basic_costs, clothes_costs, reisure_costs, ironman_costs, car_tax, car_insurance, social_insurance, life_insurance, housing_costs, saraly, income_tax, partner + car_loan + lower + credit + shopping_loan + yokoi_info + friend + family + health_care + basic_costs + clothes_costs + reisure_costs + ironman_costs + car_tax + car_insurance + social_insurance + life_insurance + housing_costs + income_tax as cost_sum from personal_incomestatements where date >= '2016-01-01'")
    respond_with(@personal_incomestatements)
  end

  def show
    respond_with(@personal_incomestatement)
  end

  def new
    @personal_incomestatement = PersonalIncomestatement.new
    respond_with(@personal_incomestatement)
  end

  def edit
  end

  def create
    @personal_incomestatement = PersonalIncomestatement.new(personal_incomestatement_params)
    @personal_incomestatement.save
    respond_with(@personal_incomestatement)
  end

  def update
    @personal_incomestatement.update(personal_incomestatement_params)
    redirect_to personal_incomestatements_path
  end

  def destroy
    @personal_incomestatement.destroy
    respond_with(@personal_incomestatement)
  end

  private
    def set_personal_incomestatement
      @personal_incomestatement = PersonalIncomestatement.find(params[:id])
    end

    def personal_incomestatement_params
      params.require(:personal_incomestatement).permit(:car_loan, :date, :lower, :credit, :shopping_loan, :yokoi_info, :friend, :family, :health_care, :basic_costs, :clothes_costs, :reisure_costs, :ironman_costs,  :car_tax, :car_insurance, :social_insurance, :life_insurance, :housing_costs, :saraly, :income_tax)
    end
end
