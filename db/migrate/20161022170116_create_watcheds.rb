class CreateWatcheds < ActiveRecord::Migration[5.0]
  def change
    create_table :watcheds do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.boolean :watched

      t.timestamps
    end
  end
end
