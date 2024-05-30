class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: %i[ show edit update destroy ]

  def po_items=(poitems_attributes)
    poitems_attributes.each do |i, poitem_attributes|
      if poitem_attributes[:suply] > 0 && poitem_attributes[:qty_ped] > 0
      self.po_items.build(poitem_attributes)
      end
    end
  end

  # GET /purchase_orders or /purchase_orders.json
  def index
    # @purchase_orders = PurchaseOrder.all
    @q = PurchaseOrder.ransack(params[:q])
    @purchase_orders = @q.result.includes(:budget_item, :user)
    @pagy, @purchase_orders = pagy(@purchase_orders)
  end

  # GET /purchase_orders/1 or /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.create(budget_item_id: BudgetItem.first.id, user_id: current_user.id)
    4.times { @purchase_order.po_items.build }
  end

  # GET /purchase_orders/1/edit
  def edit
    @purchase_order.po_items.build
    @po_items = PoItem.where(purchase_order_id: @purchase_order.id)
  end

  # POST /purchase_orders or /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.edit(@purchase_order, purchase_order_params)

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to purchase_order_url(@purchase_order), notice: "Purchase order was successfully created." }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1 or /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to purchase_orders_url, notice: "Purchase order was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1 or /purchase_orders/1.json
  def destroy
    @purchase_order.destroy!

    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: "Purchase order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fullfill
    @purchase_order = PurchaseOrder.find(params[:id])
    @budget_item = BudgetItem.find(@purchase_order.budget_item_id)
    if @purchase_order.status == "recibida"
      @budget_item.decrement!(:monto_disp, @purchase_order.total_spent)
      @budget_item.update(last_updated: Date.today)
      @budget_item.update(update_type: 1)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_params
      params.require(:purchase_order).permit(:date,
                                             :budget_item_id,
                                             :status,
                                             :user_id,
                                             :spent,
                                              po_items_attributes:
                                                [:purchase_order_id,
                                                 :suply_id,
                                                 :qty_ped,
                                                 :qty_recib,
                                                 :proveedor,
                                                 :orig_cost,
                                                 :status,
                                                 :new_cost
                                                ]
                                              )
    end
end
