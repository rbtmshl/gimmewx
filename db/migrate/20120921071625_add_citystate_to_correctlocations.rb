class AddCitystateToCorrectlocations < ActiveRecord::Migration
  
  def change
    add_column :correctlocations, :city, :string
    add_column :correctlocations, :state, :string   
  end

end

