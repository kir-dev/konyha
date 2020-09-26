require "application_system_test_case"

class KitchensTest < ApplicationSystemTestCase
  setup do
    @kitchen = kitchens(:one)
  end

  test "visiting the index" do
    visit kitchens_url
    assert_selector "h1", text: "Kitchens"
  end

  test "creating a Kitchen" do
    visit kitchens_url
    click_on "New Kitchen"

    fill_in "Floor", with: @kitchen.floor
    click_on "Create Kitchen"

    assert_text "Kitchen was successfully created"
    click_on "Back"
  end

  test "updating a Kitchen" do
    visit kitchens_url
    click_on "Edit", match: :first

    fill_in "Floor", with: @kitchen.floor
    click_on "Update Kitchen"

    assert_text "Kitchen was successfully updated"
    click_on "Back"
  end

  test "destroying a Kitchen" do
    visit kitchens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kitchen was successfully destroyed"
  end
end
