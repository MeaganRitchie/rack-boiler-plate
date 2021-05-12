class CreateBoardGames < ActiveRecord::Migration[5.2]
  def change
    create_table :board_games do |t|
      t.string :name
      t.integer :funness
      t.boolean :family
    end
  end
end
