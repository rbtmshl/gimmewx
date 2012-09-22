class CreateCorrectlocations < ActiveRecord::Migration
  def change
    create_table :correctlocations do |t|
      t.string :ip
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
