class StockTransfersController < ApplicationController
  before_action :set_stock_transfer, only: %i[ show edit update destroy ]

  # GET /stock_transfers or /stock_transfers.json
  def index
    # @stock_transfers = StockTransfer.all
    @q = StockTransfer.ransack(params[:q])
    @stock_transfers = @q.result.includes(:suply, :warehouse, :user)
    @pagy, @stock_transfers = pagy(@q.result, items: 18)
  end

  # GET /stock_transfers/1 or /stock_transfers/1.json
  def show
  end

  # GET /stock_transfers/new
  def new
    @stock_transfer = StockTransfer.new
  end

  # GET /stock_transfers/1/edit
  def edit
  end

  # POST /stock_transfers or /stock_transfers.json
  def create
    @stock_transfer = StockTransfer.new(stock_transfer_params)

    respond_to do |format|
      if @stock_transfer.save
        format.html { redirect_to stock_transfer_url(@stock_transfer), notice: "Stock transfer was successfully created." }
        format.json { render :show, status: :created, location: @stock_transfer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_transfers/1 or /stock_transfers/1.json
  def update
    respond_to do |format|
      if @stock_transfer.update(stock_transfer_params)
        format.html { redirect_to stock_transfer_url(@stock_transfer), notice: "Stock transfer was successfully updated." }
        format.json { render :show, status: :ok, location: @stock_transfer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_transfers/1 or /stock_transfers/1.json
  def destroy
    @stock_transfer.destroy!

    respond_to do |format|
      format.html { redirect_to stock_transfers_url, notice: "Stock transfer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_transfer
      @stock_transfer = StockTransfer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_transfer_params
      params.require(:stock_transfer).permit(:suply_id, :qty, :warehouse_out, :warehouse_in, :user_id)
    end
end
