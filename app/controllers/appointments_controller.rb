class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :confirm, :cancel]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.where(status: 'new').order(:create_date)
    
  end

  # GET /appointmentshistory
  def history
    @appointments = Appointment.where.not(status: 'new').order(:create_date)
    @history = true
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # GET /appointments/1/submit
  def confirm
    @appointment.status = 'confirmed'
    
    respond_to do |format|
      if @appointment.save()
        format.html { redirect_to appointments_url, notice: 'appointment was successfully confirmed.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /appointments/1/cancel
  def cancel
    @appointment.status = 'cancelled'
    
    respond_to do |format|
      if @appointment.save()
        format.html { redirect_to appointments_url, notice: 'appointment was successfully cancelled' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.status = 'new'
    @appointment.create_date = Time.now
    respond_to do |format|
      if @appointment.save
       @notice = ('The appointment was succesfuly create, you will recieve an email about your appointment confirmation')
        format.html { render :success, notice: ('The appointment was succesfuly create, you will recieve an email about your appointment confirmation') }
        format.json { render :success, status: :ok, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'appointment was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :time, :client_name, :client_email, :client_phone, :service,
        )
    end
end
