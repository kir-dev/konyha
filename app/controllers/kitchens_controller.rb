class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  # GET /kitchens
  # GET /kitchens.json
  def index
    @kitchens = Kitchen.all
  end

  # GET /kitchens/1
  # GET /kitchens/1.json
  def show
  end

  # GET /kitchens/new
  def new
    @kitchen = Kitchen.new
  end

  # GET /kitchens/1/edit
  def edit
  end

  # POST /kitchens
  # POST /kitchens.json
  def create
    @kitchen = Kitchen.new(kitchen_params)

    respond_to do |format|
      if @kitchen.save
        format.html { redirect_to @kitchen, notice: 'Kitchen was successfully created.' }
        format.json { render :show, status: :created, location: @kitchen }
      else
        format.html { render :new }
        format.json { render json: @kitchen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kitchens/1
  # PATCH/PUT /kitchens/1.json
  def update
    respond_to do |format|
      if @kitchen.update(kitchen_params)
        format.html { redirect_to @kitchen, notice: 'Kitchen was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitchen }
      else
        format.html { render :edit }
        format.json { render json: @kitchen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kitchens/1
  # DELETE /kitchens/1.json
  def destroy
    @kitchen.destroy
    respond_to do |format|
      format.html { redirect_to kitchens_url, notice: 'Kitchen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitchen
      @kitchen = Kitchen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kitchen_params
      params.require(:kitchen).permit(:floor)
    end
end
