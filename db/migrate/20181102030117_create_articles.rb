class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
     t.string :title
     t.text :description
     t.created_at :datetime
     t.updated_at :datetime
    end
  end
end