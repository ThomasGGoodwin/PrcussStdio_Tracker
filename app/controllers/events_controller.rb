class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
    @upcoming_events = Event.where("end_time > ?", DateTime.now) || [] 
    @past_events = Event.where("end_time <= ?", DateTime.now) || []
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def gig_master
    @event = Event.find(params[:id])
    @attending_rsvps = Rsvp.where(event_id: @event.id, attending: true)
    @not_attending_rsvps = Rsvp.where(event_id: @event.id, attending: false)

    query_str = ""
    Rsvp.where(event_id: @event.id).each do |rsvp|
      query_str += "email != \'" + rsvp.user_id + "\' and "
    end
    @no_rsvp_users = User.where(query_str[0..-6])
    
    if params[:selected_emails_str].present?
      params[:selected_emails] = params[:selected_emails_str].split(", ")
    end
    if params[:send].present? && params[:send] == "true"
      GigMailer.invite_email(@event.id, params[:message], params[:selected_emails]).deliver_now
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_type_id, :name, :start_time, :end_time, :location, :description)
    end
end
