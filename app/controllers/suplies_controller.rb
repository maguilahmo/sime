class SupliesController < ApplicationController
  before_action :set_suply, only: %i[ show edit update destroy ]

  # GET /suplies or /suplies.json
  def index
    # @suplies = Suply.all
    @q = Suply.ransack(params[:q])
    @suplies = @q.result(distinct: true)
    @pagy, @suplies = pagy(@q.result, items: 30 )
  end

  # GET /suplies/1 or /suplies/1.json
  def show
  end

  # GET /suplies/new
  def new
    @suply = Suply.new
  end

  # GET /suplies/1/edit
  def edit
  end

  # POST /suplies or /suplies.json
  def create
    @suply = Suply.new(suply_params)

    respond_to do |format|
      if @suply.save
        format.html { redirect_to suply_url(@suply), notice: "Suply was successfully created." }
        format.json { render :show, status: :created, location: @suply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @suply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suplies/1 or /suplies/1.json
  def update
    respond_to do |format|
      if @suply.update(suply_params)
        format.html { redirect_to suply_url(@suply), notice: "Suply was successfully updated." }
        format.json { render :show, status: :ok, location: @suply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @suply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suplies/1 or /suplies/1.json
  def destroy
    @suply.destroy!

    respond_to do |format|
      format.html { redirect_to suplies_url, notice: "Suply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suply
      @suply = Suply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def suply_params
      params.require(:suply).permit(:pn, :descripcion, :presentacion, :budget_item_id, :costo_u, :prev_cost)
    end
end
