class API::EventsController < ApplicationController
   skip_before_action :verify_authenticity_token
   before_action :set_access_control_headers

    def set_access_control_headers
      Rails.logger.info ">>> setting access control"
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Content-Type'
    end

   def create
 	   app = App.find_by(url: request.env['HTTP_ORIGIN'])
 	   if app.nil?
       render json: { error: "missing valid registered application URL" }, status: :unprocessable_entity
     else
      @event = app.events.build( event_params )  
        if @event.save
          render json: @event, status: :created
        else
          render json: { error: "missing event name" }, status: :unprocessable_entity
        end
    end
   end

   def preflight
    head 200
  end

	private
   def event_params
     params.permit(:name)
   end

 end