class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.text :long_url
      t.string :url_key

      t.timestamps
    end
  end
end
