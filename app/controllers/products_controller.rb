class ProductsController < ApplicationController
  def index
    @products = Product.includes(variants: :images).all
  end

  def show
    @product = Product.includes(variants: :images).find(product_params[:id])
  end

  def create
    @products = Product.create!(groom_params)
    @products
  rescue ActiveRecord::RecordInvalid => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def product_params
    params.permit(:id)
  end

  def create_params
    params.permit(
      _json: [:title, :body_html, :vendor, variants: [:title, :sku, :weight, :weight_unit, images: [:src]]]
    )
  end

  def groom_params
    create_params[:_json].each do |hash|
      hash['variants_attributes'] = hash.delete('variants')
      hash['variants_attributes'].each do |var|
        var['images_attributes'] = var.delete('images')
        var['images_attributes'].each do |img|
          img['source'] = img.delete('src')
        end
      end
    end
  end
end
