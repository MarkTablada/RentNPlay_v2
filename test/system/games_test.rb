require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Description", with: @game.description
    fill_in "Genre", with: @game.genre
    fill_in "Max rent duration", with: @game.max_rent_duration
    fill_in "Name", with: @game.name
    fill_in "Owner", with: @game.owner_id
    fill_in "Platform", with: @game.platform
    fill_in "Release date", with: @game.release_date
    fill_in "Rent rate", with: @game.rent_rate
    fill_in "Status", with: @game.status
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "Description", with: @game.description
    fill_in "Genre", with: @game.genre
    fill_in "Max rent duration", with: @game.max_rent_duration
    fill_in "Name", with: @game.name
    fill_in "Owner", with: @game.owner_id
    fill_in "Platform", with: @game.platform
    fill_in "Release date", with: @game.release_date
    fill_in "Rent rate", with: @game.rent_rate
    fill_in "Status", with: @game.status
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
