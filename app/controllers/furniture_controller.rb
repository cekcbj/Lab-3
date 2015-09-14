require 'csv'

class FurnitureController < ApplicationController

  def fetchfurniture

  @furniture =[]

  counter = 1

  CSV.foreach(Rails.root + "data/mf_inventory.csv", headers:true) do |row|
    if row.to_h["quantity"].to_i > 0
    furniture_item = FurnitureItem.new
    furniture_item.id = counter
    furniture_item.pid = row.to_h["pid"]
    furniture_item.item  = row.to_h["item"]
    furniture_item.description  = row.to_h["description"]
     if row.to_h["condition"] == "good"
    furniture_item.price =  row.to_h["price"].to_i* 0.9
    furniture_item.clearance = true
    elsif row.to_h["condition"]== "average"
    furniture_item.price = row.to_h["price"].to_i * 0.8
    furniture_item.clearance = true
    else
      furniture_item.price= row.to_h["price"]
      furniture_item.clearance = false
    end
    furniture_item.condition = row.to_h["condition"]
    furniture_item.dimension_w = row.to_h["dimension_w"]
    furniture_item.dimension_l = row.to_h["dimension_l"]
    furniture_item.dimension_h = row.to_h["dimension_h"]
    furniture_item.img_name = row.to_h["img_name"]
    furniture_item.quantity = row.to_h["quantity"]
    furniture_item.category = row.to_h["category"]

    @furniture << furniture_item
  end

        counter += 1

  end

    @furniture

end

def homepage

end


  def list
    @furniture = fetchfurniture
  end

  def detail
    @furniture = fetchfurniture
    @furn = @furniture.find {|f| f.id == params[:id].to_i}
  end




end
