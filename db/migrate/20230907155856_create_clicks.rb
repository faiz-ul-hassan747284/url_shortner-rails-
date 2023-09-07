class CreateClicks < ActiveRecord::Migration[6.0]
  def change
    create_table :clicks do |t|
      t.belongs_to :url
      t.string :platform
      t.string :browser

      t.timestamps
    end
  end
end
