require 'rails_helper'

describe "Links request", type: :request do

  it "returns all hot links" do
    links = create_list(:link, 11)
    links.first.update(reads: 4)
    links.last.update(reads: 2)

    get "/api/v1/links"

    expect(response).to be_success
    links_response = JSON.parse(response.body)

    expect(links_response.count).to eq(10)
    expect(links_response).to be_an(Array)
    expect(links_response.first).to be_a(Hash)
    expect(links_response.first["url"]).to eq(links.first.url)
    expect(links_response[1]["url"]).to eq(links.last.url)
  end
  
  it "creates a link" do
    post "/api/v1/links?url=https://www.wunderground.com"

    expect(response).to be_success
    link = JSON.parse(response.body)

    expect(link["url"]).to eq("https://www.wunderground.com")
  end
end