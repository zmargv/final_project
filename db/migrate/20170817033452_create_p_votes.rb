class CreatePVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :p_votes do |t|
      t.integer :up
      t.integer :user_id
      t.integer :post_id

      t.timestamps

    end
  end
end
