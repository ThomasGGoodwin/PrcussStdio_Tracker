class SignInsController < ApplicationController
  before_action :set_sign_in, only: %i[ show edit update destroy ]

  # GET /sign_ins or /sign_ins.json
  def index
    @sign_ins = SignIn.all
  end

  # GET /sign_ins/1 or /sign_ins/1.json
  def show
  end

  # GET /sign_ins/new
  def new
    @sign_in = SignIn.new
  end

  # GET /sign_ins/1/edit
  def edit
  end

  # POST /sign_ins or /sign_ins.json
  def create
    @sign_in = SignIn.new(sign_in_params)

    respond_to do |format|
      if @sign_in.save
        format.html { redirect_to sign_in_url(@sign_in), notice: "Sign in was successfully created." }
        format.json { render :show, status: :created, location: @sign_in }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sign_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sign_ins/1 or /sign_ins/1.json
  def update
    respond_to do |format|
      if @sign_in.update(sign_in_params) && valid_reason?
        format.html { redirect_to sign_in_url(@sign_in), notice: "Sign in was successfully updated." }
        format.json { render :show, status: :ok, location: @sign_in }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sign_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_ins/1 or /sign_ins/1.json
  def destroy
    @sign_in.destroy

    respond_to do |format|
      format.html { redirect_to sign_ins_url, notice: "Sign in was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_in
      @sign_in = SignIn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sign_in_params
      params.require(:sign_in).permit(:user_id, :event_id, :signin_time, :attending, :reason)
    end

    # When not attending require a reason to be filled in the box
    def valid_reason?
      if subject.attending == true
        return true
      end
      return !subject.reason.empty?
    end
end
