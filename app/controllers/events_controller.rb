class EventsController < Spree::BaseController
  include Spree::Core::ControllerHelpers
  helper Spree::BaseHelper

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def push
    Event.create do |e|
      e.title = 'Title'
      e.content = 'Content'
    end
    redirect_to :back, notice: 'Добавлено новое событие'
  end

  def destroy
    event = Event.find(params[:id])
    title = event.title
    event.destroy
    redirect_to :back, notice: "Событие #{title} удалено"
  end
end