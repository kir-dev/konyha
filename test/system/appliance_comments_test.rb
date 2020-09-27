require "application_system_test_case"

class ApplianceCommentsTest < ApplicationSystemTestCase
  setup do
    @appliance_comment = appliance_comments(:one)
  end

  test "visiting the index" do
    visit appliance_comments_url
    assert_selector "h1", text: "Appliance Comments"
  end

  test "creating a Appliance comment" do
    visit appliance_comments_url
    click_on "New Appliance Comment"

    fill_in "Appliance", with: @appliance_comment.appliance_id
    fill_in "Body", with: @appliance_comment.body
    fill_in "Category", with: @appliance_comment.category
    click_on "Create Appliance comment"

    assert_text "Appliance comment was successfully created"
    click_on "Back"
  end

  test "updating a Appliance comment" do
    visit appliance_comments_url
    click_on "Edit", match: :first

    fill_in "Appliance", with: @appliance_comment.appliance_id
    fill_in "Body", with: @appliance_comment.body
    fill_in "Category", with: @appliance_comment.category
    click_on "Update Appliance comment"

    assert_text "Appliance comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Appliance comment" do
    visit appliance_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appliance comment was successfully destroyed"
  end
end
