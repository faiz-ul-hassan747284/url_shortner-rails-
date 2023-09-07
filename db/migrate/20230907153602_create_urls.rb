class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :shortened_url
      t.timestamps
    end
  end
end
