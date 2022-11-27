class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  before_action :is_logged_in, except: [:login, :create_login, :logout, :create, :new]
  before_action :is_admin, except: [:login, :create_login, :logout, :show, :create, :new, :edit]
  before_action :is_account_owner, only: [:show, :edit, :update, :destroy]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  def is_account_owner
    if session[:account_id] != @account.id
      if session[:is_admin] != 0
        redirect_to "/games", notice: "Action is forbidden"
      end
    end
  end

  def login
    @account = Account.new
  end

  def create_login
		account = Account.find_by(username: params[:username])

		if account.present? && account.authenticate(params[:password])
			session[:account_id] = account.id
			session[:is_admin] = account.user_type

			redirect_to "/games", notice: "success"
		else
			redirect_to "/login", notice: "Login Failed"
		end
	end

  def logout
		session[:account_id] = nil
		session[:is_admin] = nil

		redirect_to "/login"
	end


  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    @account.user_type = 1

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end

    session[:account_id] = @account.id

  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:user_type, :username, :password, :password_confirmation, :full_name, :email, :mobile_number)
    end
end
