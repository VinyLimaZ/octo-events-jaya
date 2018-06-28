class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :action
      t.references :issue, foreign_key: true

      t.timestamps
    end
  end
end
