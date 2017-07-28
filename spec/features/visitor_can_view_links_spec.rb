require 'rails_helper'

feature "Visitor" do
  scenario "can view an ordered list of links" do
    links = create_list(:link, 11)
    links.first.update(reads: 4)
    links.last.update(reads: 2)

    visit root_path

    expect(page).to have_content("1. #{links.first.url}")
    expect(page).to have_content("2. #{links.last.url}")
    expect(page).to have_content("3. #{links.find(2).url}")
    expect(page).to_not have_content(links.find(10).url)
  end
end