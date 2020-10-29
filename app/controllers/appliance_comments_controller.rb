class ApplianceCommentsController < ApplicationController
  before_action :set_appliance_comment, only: [:show, :edit, :update, :destroy]

  # GET /appliance_comments
  # GET /appliance_comments.json
  def index
    @appliance_comments = Appliance.includes(:appliance_comments).all
                                   .map{ |appliance| appliance.comments.last }
                                   .sort_by(&:updated_at).reverse
  end

  # GET /appliance_comments/1
  # GET /appliance_comments/1.json
  def show
  end

  # GET /appliance_comments/new
  def new
    @appliance_comment = ApplianceComment.new
    authorize @appliance_comment
  end

  # GET /appliance_comments/1/edit
  def edit
    authorize @appliance_comment
  end

  # POST /appliance_comments
  # POST /appliance_comments.json
  def create
    @appliance_comment = ApplianceComment.new(appliance_comment_params)
    @appliance_comment.owner = current_user
    authorize @appliance_comment
    respond_to do |format|
      if @appliance_comment.save
        format.html { redirect_to @appliance_comment, notice: 'Appliance comment was successfully created.' }
        format.json { render :show, status: :created, location: @appliance_comment }
      else
        format.html { render :new }
        format.json { render json: @appliance_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appliance_comments/1
  # PATCH/PUT /appliance_comments/1.json
  def update
    authorize @appliance_comment
    respond_to do |format|
      if @appliance_comment.update(appliance_comment_params)
        format.html { redirect_to @appliance_comment, notice: 'Appliance comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appliance_comment }
      else
        format.html { render :edit }
        format.json { render json: @appliance_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appliance_comments/1
  # DELETE /appliance_comments/1.json
  def destroy
    authorize @appliance_comment
    @appliance_comment.destroy
    respond_to do |format|
      format.html { redirect_to appliance_comments_url, notice: 'Appliance comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appliance_comment
      @appliance_comment = ApplianceComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appliance_comment_params
      params.require(:appliance_comment).permit(:category, :body, :appliance_id, :image)
    end
end
