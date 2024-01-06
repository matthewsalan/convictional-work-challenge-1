class InventoriesController < ApplicationController
  def index
    @inventory = Variant.all
  end
end
