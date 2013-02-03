class CreateCrawlerCaches < ActiveRecord::Migration
  def change
    create_table :crawler_caches do |t|
      t.text :page_content
      t.string :url

      t.timestamps
    end
  end
end
