class AlleysController < ApplicationController
  before_action :set_alley, only: [:show, :edit, :update, :destroy]

  # GET /alleys
  # GET /alleys.json
  def index
    @alleys = Alley.all
  end

  # GET /alleys/1
  # GET /alleys/1.json
  def show
  end

  # GET /alleys/new
  def new
    @alley = Alley.new
  end

  # GET /alleys/1/edit
  def edit
  end

  # POST /alleys
  # POST /alleys.json
  def create
    @alley = Alley.new(alley_params)

    respond_to do |format|
      if @alley.save
        format.html { redirect_to @alley, notice: 'Alley was successfully created.' }
        format.json { render :show, status: :created, location: @alley }
      else
        format.html { render :new }
        format.json { render json: @alley.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alleys/1
  # PATCH/PUT /alleys/1.json
  def update
    respond_to do |format|
      if @alley.update(alley_params)
        format.html { redirect_to @alley, notice: 'Alley was successfully updated.' }
        format.json { render :show, status: :ok, location: @alley }
      else
        format.html { render :edit }
        format.json { render json: @alley.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alleys/1
  # DELETE /alleys/1.json
  def destroy
    @alley.destroy
    respond_to do |format|
      format.html { redirect_to alleys_url, notice: 'Alley was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alley
      @alley = Alley.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alley_params
      params.require(:alley).permit(:name, :address_id)
    end
end
