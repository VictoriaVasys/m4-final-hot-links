class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  
  def self.hot_links
    Link.all.order(reads: :desc).limit(10)
  end
  
  def update_reads
    update(reads: reads + 1)
  end
  
end
