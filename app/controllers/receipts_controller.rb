class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[ show edit update destroy ]
  after_action :delete_session, only: [:link_and_return]

  # GET /receipts or /receipts.json
  def index
    @receipts = Receipt.all
  end

  # GET /receipts/1 or /receipts/1.json
  def show
      session[:receipt_id] = @receipt.id
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
  end

  def calculate
    @receipt
  end

  def delete_session
    session[:request_id] = nil 
    session[:receipt_id] = nil
  end

  def link_and_return
      @request = Request.find(session[:request_id])
      @request.receipt_id = session[:receipt_id]

      @request.save

      redirect_to "/requests/#{session[:request_id]}"
  end
  
  # POST /receipts or /receipts.json
  def create

    @receipt = Receipt.new(receipt_params)

    @request = Request.find(@receipt.request_id)

    session[:request_id] = @receipt.request_id

    @request.receipt_status = "Completed"

    @request.save

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully created." }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to receipts_url, notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:name, :mobile_number, :house_number, :barangay, :city, :province, :game, :rent_rate, :start_date, :rent_duration, :end_date, :sub_total, :payment_method, :request_id, :receiver_name)
    end
end
