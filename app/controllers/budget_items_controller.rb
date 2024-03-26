class BudgetItemsController < ApplicationController
  before_action :set_budget_item, only: %i[ show edit update destroy ]

  # GET /budget_items or /budget_items.json
  def index
    # @budget_items = BudgetItem.all
    @q = BudgetItem.ransack(params[:q])
    @budget_items = @q.result(distinct: true)
    @pagy, @budget_items = pagy(@q.result, items: 18 )
  end

  # GET /budget_items/1 or /budget_items/1.json
  def show
  end

  # GET /budget_items/new
  def new
    @budget_item = BudgetItem.new
  end

  # GET /budget_items/1/edit
  def edit
  end

  # POST /budget_items or /budget_items.json
  def create
    @budget_item = BudgetItem.new(budget_item_params)

    respond_to do |format|
      if @budget_item.save
        format.html { redirect_to budget_item_url(@budget_item), notice: "Budget item was successfully created." }
        format.json { render :show, status: :created, location: @budget_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @budget_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_items/1 or /budget_items/1.json
  def update
    respond_to do |format|
      if @budget_item.update(budget_item_params)
        format.html { redirect_to budget_item_url(@budget_item), notice: "Budget item was successfully updated." }
        format.json { render :show, status: :ok, location: @budget_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @budget_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_items/1 or /budget_items/1.json
  def destroy
    @budget_item.destroy!

    respond_to do |format|
      format.html { redirect_to budget_items_url, notice: "Budget item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_item
      @budget_item = BudgetItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_item_params
      params.require(:budget_item).permit(:partida, :descripcion, :monto_disp, :last_updated, :update_type)
    end
end
