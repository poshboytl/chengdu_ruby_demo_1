class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.integer :user_id
      t.text :message
      t.string :revision

      t.timestamps
    end

    add_index :commits, :user_id
  end
end
