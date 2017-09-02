class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.where(:status => "Active").order(:id)
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find params[:id]
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)
    @device.uuid = SecureRandom.uuid

    respond_to do |format|
      if @device.save
        flash[:notice] = "Device created successfully"
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        flash[:notice] = "Shop creation unsuccessful"
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    puts @device.inspect
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :index, status: :ok, location: @device }
      else
        format.html { render :index }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_user_device
    # check that the device is assigned to the observer
    # if not assign it 

    Rails.logger.info("device_ids : "+params[:device_ids].to_s)
    observer = User.find(params[:observer_id])
    observer.device_ids = params[:device_ids]

    # @device_ids = params[:device_ids]
    # @observer = User.find(params[:observer_id])

    # unless @device_ids.blank?
    #   @device_ids.each do |id|
    #     Rails.logger.info("id is : "+id)
    #     if !Device.find(id).users.exists?(params[:observer_id])
    #       @user_device = UserDevice.new
    #       @user_device.user_id = params[:observer_id]
    #       @user_device.device_id = id
    #       @user_device.save
    #     end
    #   end
    # end

    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
    end
    


    # if other devices assigned previously are not listed unassign those devices
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.fetch(:device, {}).permit(:name, :model, :device_id, :place, :latitude, :longitude)
    end
end
