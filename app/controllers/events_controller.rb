class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html
skip_before_filter :verify_authenticity_token
  def index
    #@events = Event.all.order('start asc').where("end >= ?", Time.now).where('open_range_id = 1')
    @events = Event.all.order('start desc').where('open_range_id = 1')
    @events_update = Event.all.order('updated_at desc').where('open_range_id = 1').where("updated_at >= ?", Time.now - 10.days)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :content, :category_id, :project_id, :start, :end, :place, :open_range_id, :reference_link)
    end
end
