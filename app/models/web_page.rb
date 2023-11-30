# app/models/web_page.rb
class WebPage < ApplicationRecord
    validates :url, presence: true
  
    before_save :set_default_file_name
    before_save :update_metadata
  
    def set_default_file_name
      self.file_name ||= "#{url.parameterize.underscore}.html"
    end
  
    def update_metadata
      self.last_fetched_at = Time.now
      doc = Nokogiri::HTML(content)
      self.link_count = doc.css('a').count
      self.image_count = doc.css('img').count
    end
  end
  