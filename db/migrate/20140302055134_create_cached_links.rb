class CreateCachedLinks < ActiveRecord::Migration
  def change
    create_table :cached_links do |t|
      t.string :url
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
