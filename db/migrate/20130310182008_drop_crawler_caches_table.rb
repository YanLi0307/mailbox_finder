class DropCrawlerCachesTable < ActiveRecord::Migration
  def up # this code gets executed on rake db:migrate
    drop_table :crawler_caches
  end

  def down #this code gets executed on rake db:rollback
    create_table :crawler_caches do |t|
      t.text :page_content
      t.string :url

      t.timestamps
    end
  end
end
