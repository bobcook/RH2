class HohhsController < ApplicationController
  before_action :set_hohh, only: [:show, :edit, :update, :destroy]

  # GET /hohhs
  # GET /hohhs.json
  def index
    @hohhs = Hohh.all
  end

  # GET /hohhs/1
  # GET /hohhs/1.json
  def show
  end

  # GET /hohhs/new
  def new
    @hohh = Hohh.new
  end

  # GET /hohhs/1/edit
  def edit
  end

  # POST /hohhs
  # POST /hohhs.json
  def create
    @hohh = Hohh.new(hohh_params)

    respond_to do |format|
      if @hohh.save
        format.html { redirect_to @hohh, notice: 'Hohh was successfully created.' }
        format.json { render :show, status: :created, location: @hohh }
      else
        format.html { render :new }
        format.json { render json: @hohh.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hohhs/1
  # PATCH/PUT /hohhs/1.json
  def update
    respond_to do |format|
      if @hohh.update(hohh_params)
        format.html { redirect_to @hohh, notice: 'Hohh was successfully updated.' }
        format.json { render :show, status: :ok, location: @hohh }
      else
        format.html { render :edit }
        format.json { render json: @hohh.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hohhs/1
  # DELETE /hohhs/1.json
  def destroy
    @hohh.destroy
    respond_to do |format|
      format.html { redirect_to hohhs_url, notice: 'Hohh was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hohh
      @hohh = Hohh.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hohh_params
      params.require(:hohh).permit(:name, :address)
    end
end
