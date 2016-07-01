class IncomeStatementsController < ApplicationController
  before_action :set_income_statement, only: [:show, :edit, :update, :destroy]
  before_filter :basic
  respond_to :html

  def index
    @income_statements = IncomeStatement.totalllll
    respond_with(@income_statements)

  end

  def show
    respond_with(@income_statement)
  end

  def new
    @income_statement = IncomeStatement.new
    respond_with(@income_statement)
  end

  def edit
  end

  def create
    @income_statement = IncomeStatement.new(income_statement_params)
    @income_statement.save
    respond_with(@income_statement)
  end

  def update
    @income_statement.update(income_statement_params)
    respond_with(@income_statement)
  end

  def destroy
    @income_statement.destroy
    respond_with(@income_statement)
  end

  private
    def set_income_statement
      @income_statement = IncomeStatement.find_by_sql(["select id, date, ses_business_revenue, representative_reward, personnel_expenses, sales_support_fee, social_insurance_costs, tax_expense, business_tax, delay_loss, communications_expenses, transportation_cost, capital_investment, advertising_expenses, entertainment_expenses, affairs_costs, shareholder_costs, lower_costs, debt_costs, realestate, COALESCE(representative_reward, 0) + COALESCE(personnel_expenses, 0) + COALESCE(sales_support_fee, 0) + COALESCE(social_insurance_costs, 0) + COALESCE(tax_expense, 0) + COALESCE(business_tax, 0) + COALESCE(delay_loss, 0) + COALESCE(communications_expenses, 0) + COALESCE(transportation_cost, 0) + COALESCE(capital_investment, 0) + COALESCE(advertising_expenses, 0) + COALESCE(entertainment_expenses, 0) + COALESCE(affairs_costs, 0) + COALESCE(shareholder_costs, 0) + COALESCE(lower_costs, 0) + COALESCE(debt_costs, 0) + COALESCE(realestate, 0) as cost_sum from income_statements where id = ?", params[:id]]).first
    end

    def income_statement_params
      params.require(:income_statement).permit(:date, :ses_business_revenue, :representative_reward, :personnel_expenses, :sales_support_fee, :social_insurance_costs, :tax_expense, :business_tax, :delay_loss, :communications_expenses, :transportation_cost, :capital_investment, :advertising_expenses, :entertainment_expenses, :affairs_costs, :shareholder_costs, :lower_costs, :debt_costs, :realestate)
    end
end
