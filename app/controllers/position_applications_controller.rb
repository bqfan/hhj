class PositionApplicationsController < ApplicationController

  def index
  end

  def show
  end

  def new
    call = Call.find params[:call_id]
    @position_application = call.position_applications.build

    respond_to do |format|
      format.fragment
    end
  end

  def edit
  end

  def create
    position_application_params = params[:position_application] || {}
    position_application = FactoryGirl.create :position_application,
      position_application_params.merge(call: Call.find(params[:call_id]))

    respond_to do |format|
      format.json { render json: position_application.to_json }
      format.html { redirect_to action: :show, id: position_application._id }
    end
  end

  def update
  end

  def destroy
  end

end
