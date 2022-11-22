class AddMaturityRatingToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :maturity_rating, :string
  end
end
