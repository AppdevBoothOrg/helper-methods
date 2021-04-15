require "application_system_test_case"

class DirectorsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit directors_url
    assert_selector "h1", text: "List of all directors"
  end

  test "creating a director" do
    original_director_count = Director.count

    visit directors_url
    click_on "Add a new director"

    fill_in "Last name", with: "A new director's last_name"
    fill_in "First name", with: "A new director's first_name"
    click_on "Create Director"

    assert_text "director created successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count + 1, ending_director_count
  end

  test "updating a director" do
    @director = directors(:one)

    visit "/directors/#{@director.id}/edit"

    fill_in "Last name", with: "Some other last name"
    fill_in "First name", with: "Some other first name"

    click_on "Update Director"
    
    assert_text "Director updated successfully"

    @director.reload # Why do we need this?
    assert_equal "Some other first name", @director.first_name
    assert_equal "Some other last name", @director.last_name
  end

  test "destroying a director" do
    @director = directors(:one)
    original_director_count = Director.count

    visit directors_url
    click_on "Show details", match: :first
    click_on "Delete director"

    assert_text "Director deleted successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count - 1, ending_director_count
  end
end
