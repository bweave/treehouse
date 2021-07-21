class MyForm
  include ActionView::Helpers::FormHelper
  attr_accessor :output_buffer
end

class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  def index
    @receipts = Receipt.includes(:receipt_items).order(:purchased_at)
  end

  # GET /receipts/1
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  def create
    @receipt = Receipt.new(receipt_params)

    if @receipt.save
      redirect_to @receipt, notice: 'Receipt was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /receipts/1
  def update
    if @receipt.update(receipt_params)
      redirect_to @receipt, notice: 'Receipt was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /receipts/1
  def destroy
    @receipt.destroy
    redirect_to receipts_url, notice: 'Receipt was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.includes(:receipt_items).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(
        :notes,
        :purchased_at,
        :sales_tax_cents,
        :store_name,
        receipt_items_attributes: [
          :id,
          :_destroy,
          :name,
          :price_cents,
          :quantity,
        ],
      )
    end
end
