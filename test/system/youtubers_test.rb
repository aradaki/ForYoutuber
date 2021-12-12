require "application_system_test_case"

class YoutubersTest < ApplicationSystemTestCase
  setup do
    @youtuber = youtubers(:one)
  end

  test "visiting the index" do
    visit youtubers_url
    assert_selector "h1", text: "Youtubers"
  end

  test "creating a Youtuber" do
    visit youtubers_url
    click_on "New Youtuber"

    fill_in "Image", with: @youtuber.image_id
    fill_in "Introduction", with: @youtuber.introduction
    fill_in "Name", with: @youtuber.name
    click_on "Create Youtuber"

    assert_text "Youtuber was successfully created"
    click_on "Back"
  end

  test "updating a Youtuber" do
    visit youtubers_url
    click_on "Edit", match: :first

    fill_in "Image", with: @youtuber.image_id
    fill_in "Introduction", with: @youtuber.introduction
    fill_in "Name", with: @youtuber.name
    click_on "Update Youtuber"

    assert_text "Youtuber was successfully updated"
    click_on "Back"
  end

  test "destroying a Youtuber" do
    visit youtubers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Youtuber was successfully destroyed"
  end
end
