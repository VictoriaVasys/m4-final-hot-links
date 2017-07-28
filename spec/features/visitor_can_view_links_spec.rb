require 'rails_helper'

feature "Visitor" do
  scenario "can view an ordered list of links" do
    links = create_list(:link, 11)
    links[0].update(reads: 4)
    links[1].update(reads: 2)
    links[2].update(reads: 0)

    visit root_path

    expect(page).to have_content(links[0].url)
    expect(page).to have_content(links[1].url)
    expect(page).to_not have_content(links[2].url)
  end
end