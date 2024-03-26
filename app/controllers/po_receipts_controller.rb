class PoReceiptsController < ApplicationController
  before_action :set_po_receipt, only: %i[ show edit update destroy ]

  # GET /po_receipts or /po_receipts.json
  def index
    # @po_receipts = PoReceipt.all
    @q = PoReceipt.ransack(params[:q])
    @po_receipts = @q.result.includes(:suply, :warehouse, :user)
    @pagy, @po_receipts = pagy(@po_receipts)
  end

  # GET /po_receipts/1 or /po_receipts/1.json
  def show
  end

  # GET /po_receipts/new
  def new
    @po_receipt = PoReceipt.new
  end

  # GET /po_receipts/1/edit
  def edit
  end

  # POST /po_receipts or /po_receipts.json
  def create
    @po_receipt = PoReceipt.new(po_receipt_params)

    respond_to do |format|
      if @po_receipt.save
        format.html { redirect_to po_receipt_url(@po_receipt), notice: "Po receipt was successfully created." }
        format.json { render :show, status: :created, location: @po_receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @po_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /po_receipts/1 or /po_receipts/1.json
  def update
    respond_to do |format|
      if @po_receipt.update(po_receipt_params)
        format.html { redirect_to po_receipt_url(@po_receipt), notice: "Po receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @po_receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @po_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /po_receipts/1 or /po_receipts/1.json
  def destroy
    @po_receipt.destroy!

    respond_to do |format|
      format.html { redirect_to po_receipts_url, notice: "Po receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_po_receipt
      @po_receipt = PoReceipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def po_receipt_params
      params.require(:po_receipt).permit(:purchase_order_id, :suply_id, :warehouse_id, :qty, :new_cost, :proveedor, :user_id)
    end
end
