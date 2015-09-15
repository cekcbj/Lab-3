class FurnitureItem

  attr_accessor :id, :pid, :item, :description, :price, :condition, :dimension_w,
  :dimension_l, :dimension_h, :img_name, :quantity, :category, :clearance, :clearanceprice

  def clearancecheck
    @furn
    if @condition == "good"
      @clearance= true
      @clearanceprice = @price.to_i * 0.90
      "Clearance Item"

    elsif @condition == "average"
      @clearance = true
      @clearanceprice = @price.to_i * 0.80
      "Clearance Item"
    end
end

end
