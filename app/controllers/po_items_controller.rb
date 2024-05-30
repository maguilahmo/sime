class PoItemsController < ApplicationController
  before_action :set_po_item, only: %i[ show edit update destroy ]

  # GET /po_items or /po_items.json
  def index
    @po_items = PoItem.all
  end

  # GET /po_items/1 or /po_items/1.json
  def show
  end

  # GET /po_items/new
  def new
    @po_item = PoItem.new
  end

  # GET /po_items/1/edit
  def edit
  end

  # POST /po_items or /po_items.json
  def create
    @po_item = PoItem.new(po_item_params)
    @purchase_order = PurchaseOrder.find(@po_item.purchase_order_id)
    @purchase_order.increment!(:calc_spent, @po_item.cost)
    respond_to do |format|
      if @po_item.save
        format.html { redirect_to po_item_url(@po_item), notice: "Po item was successfully created." }
        format.json { render :show, status: :created, location: @po_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @po_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /po_items/1 or /po_items/1.json
  def update
    respond_to do |format|
      if @po_item.update(po_item_params)
        format.html { redirect_to po_item_url(@po_item), notice: "Po item was successfully updated." }
        format.json { render :show, status: :ok, location: @po_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @po_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /po_items/1 or /po_items/1.json
  def destroy
    @po_item.destroy!

    respond_to do |format|
      format.html { redirect_to po_items_url, notice: "Po item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_po_item
      @po_item = PoItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def po_item_params
      params.require(:po_item).permit(:purchase_order_id,
                                      :suply_id,
                                      :qty_ped,
                                      :qty_recib,
                                      :proveedor,
                                      :orig_cost,
                                      :status,
                                      :new_cost
                                      )
    end
end
