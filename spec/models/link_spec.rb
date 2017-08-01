require 'rails_helper'

describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }
  
  it "should return 10 .hot_links in descending order of most-read" do
    links = create_list(:link, 11)
    links[1].update(reads: 4)
    links.last.update(reads: 2)
    
    expect(Link.hot_links.count).to eq(10)
    expect(Link.hot_links.first.url).to eq(links[1].url)
    expect(Link.hot_links.second.url).to eq(links.last.url)
  end
  
  it "should add a read with .update_reads count" do
    link1, link2 = create_list(:link, 2)
    link2.update(reads: 4)
    link1.update_reads
    link2.update_reads
    
    expect(link1.reads).to eq(2)
    expect(link2.reads).to eq(5)
  end
end
