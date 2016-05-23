class EventsController < Spree::BaseController
  include Spree::Core::ControllerHelpers
  helper Spree::BaseHelper

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.title = params[:content][:event_title][:value]
    @event.content = params[:content][:event_content][:value]
    image_src = begin
      params[:content][:event_image][:attributes][:src]
    rescue
      ''
    end
    image_match = /system\/images\/(\d+)/.match(image_src)
    image_id = image_match ? image_match[1].to_i : nil
    @event.mercury_image_id = image_id
    @event.save!
    render nothing: true
  end

  def push
    Event.create do |e|
      e.title = 'Event'
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