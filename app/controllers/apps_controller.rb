class AppsController < ApplicationController
  def index
    @apps = App.all 

  end

  def show
    @app = App.find(params[:id])
    @events = @app.events.group_by(&:name)
  end

  def new
    @app = App.new
  end

  def edit
    @app = App.find(params[:id])
  end

   def create
     @app = App.new(params.require(:app).permit(:name, :url))
     @app.user_id = current_user.id
     @app.save
     redirect_to apps_path
  end

  def destroy
     @app = App.find(params[:id])
     @app.destroy!
     redirect_to apps_path
  end

    def update
     @app = App.find(params[:id])
     @app.update_attributes(params.require(:app).permit(:name, :url))
     redirect_to apps_path
     end
end
