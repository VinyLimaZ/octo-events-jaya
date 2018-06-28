class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :url
      t.string :title
      t.string :state
      t.string :body
      t.string :number

      t.timestamps
    end
  end
end
