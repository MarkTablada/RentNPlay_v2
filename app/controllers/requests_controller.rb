class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy ]
  before_action :get_id, only: [:show]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new

    @game = Game.find(params[:id]).owner_id
  end

  # GET /requests/1/edit
  def edit
    @game = Game.find(Request.find(params[:id]).game_id).owner_id
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    @request.user_id = session[:account_id]

    @request.status = "Pending"

    respond_to do |format|
      if @request.save
        format.html { redirect_to request_url(@request), notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_id
    session[:current_request] = @request.id
  end

  def respond
  end

  def accept
    @request = Request.find(session[:current_request])
    
    @request.status = "accepted"
    
    session[:current_request] = nil
    @request.save
    redirect_to "/requests/#{@request.id}"
  end

  def reject
    @request = Request.find(session[:current_request])
    
    @request.status = "rejected"
    
    session[:current_request] = nil
    @request.save
    redirect_to "/requests/#{@request.id}"
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update

    

    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to "/games/#{@request.game_id}", notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @back_to_game = @request.game_id
    @request.destroy

    respond_to do |format|
      format.html { redirect_to "/games/#{@back_to_game}", notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:game_id, :user_id, :status, :rent_duration)
    end
end
