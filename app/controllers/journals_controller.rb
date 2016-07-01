class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]
  before_filter :basic, only: [ :edit, :update, :destroy]
  respond_to :html

  def index
    @journals = Journal.order("date desc").order('id desc').page(params[:page]).per(30)
    @journals_group_project = Journal.find_by_sql("select project_id, sum(time) as sum_time from journals group by project_id")
  #  raise @journals_group_project.inspect
    @journal = Journal.new
    @monthty_time_amount = @journal.monthty_time_amount()
  end

  def show
    respond_with(@journal)
  end

  def new
    @journal = Journal.new
    respond_with(@journal)
  end

  def edit
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.save
    respond_with(@journal)
  end

  def update
    @journal.update(journal_params)
    respond_with(@journal)
  end

  def destroy
    @journal.destroy
  end

  private
    def set_journal
      @journal = Journal.find(params[:id])
    end

    def journal_params
      params.require(:journal).permit(:title, :content, :cost, :distance, :category_id, :time, :date, :place, :project_id, :open_range_id, :issue_id,
        categories_attributes: [:id, :title]
        )
    end
end
