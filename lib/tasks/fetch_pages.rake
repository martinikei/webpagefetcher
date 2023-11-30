
#Thank you for giving me opportunity to do this challenge.
#ありがとうございました

require 'nokogiri'
require 'fileutils'

namespace :fetch_pages do
  desc 'Fetch and save web pages with metadata and assets'
  task :fetch => :environment do
    urls = ENV['URLS'].split(',')

    urls.each do |url|
      begin
        puts "Downloading starting...."

        # Fetch HTML content
        response = Net::HTTP.get(URI.parse(url))
        response.force_encoding('UTF-8')#Had several problems with file saving because of missing UTF encoding -
        #Error fetching or saving the page: "\xC4" from ASCII-8BIT to UTF-8


        web_page = WebPage.create(url: url, content: response)
        web_page.update_metadata

        # Create directory for the saved page
        output_directory = "#{web_page.file_name}"
        FileUtils.mkdir_p(output_directory)

        # Save HTML content
        html_file_path = "#{output_directory}/#{web_page.file_name}"
        File.write(html_file_path, response)
        # Fetch and save linked assets
        doc = Nokogiri::HTML(response)
        assets = doc.css('link[rel="stylesheet"][href], script[src], img[src]')

        assets.each do |asset|
            asset_url = URI.join(url, asset['href'] || asset['src']).to_s
            asset_content = URI.open(asset_url).read.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
          
            asset_file_path = "#{output_directory}/#{File.basename(asset_url)}"
            File.write(asset_file_path, asset_content)
          end
          
        

        puts "Page and assets saved successfully to #{output_directory}"
        puts "Last fetched at: #{web_page.last_fetched_at}"
        puts "Number of links on the page: #{web_page.link_count}"
        puts "Number of images on the page: #{web_page.image_count}"
      rescue StandardError => e
        puts "Error fetching or saving the page: #{e.message}"
      end
    end
  end
end
