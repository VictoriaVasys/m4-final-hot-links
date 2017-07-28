class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  
  def self.hot_links
    Link.all.order(reads: :desc).limit(10)
  end
  
end
