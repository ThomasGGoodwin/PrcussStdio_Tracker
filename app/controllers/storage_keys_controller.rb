class StorageKeysController < ApplicationController
  before_action :set_storage_key, only: %i[ show edit update destroy ]

  # GET /storage_keys or /storage_keys.json
  def index
    @storage_keys = StorageKey.all
  end

  # GET /storage_keys/1 or /storage_keys/1.json
  def show
  end

  # GET /storage_keys/new
  def new
    @storage_key = StorageKey.new
  end

  # GET /storage_keys/1/edit
  def edit
  end

  # POST /storage_keys or /storage_keys.json
  def create
    @storage_key = StorageKey.new(storage_key_params)

    respond_to do |format|
      if @storage_key.save
        format.html { redirect_to storage_key_url(@storage_key), notice: "Storage key was successfully created." }
        format.json { render :show, status: :created, location: @storage_key }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storage_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_keys/1 or /storage_keys/1.json
  def update
    respond_to do |format|
      if @storage_key.update(storage_key_params)
        format.html { redirect_to storage_key_url(@storage_key), notice: "Storage key was successfully updated." }
        format.json { render :show, status: :ok, location: @storage_key }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storage_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_keys/1 or /storage_keys/1.json
  def destroy
    @storage_key.destroy

    respond_to do |format|
      format.html { redirect_to storage_keys_url, notice: "Storage key was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_key
      @storage_key = StorageKey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_key_params
      params.require(:storage_key).permit(:user_id)
    end
end
