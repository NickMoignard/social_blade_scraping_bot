class SocialBladeYtJob < ApplicationJob
  BASE_URL = 'https://socialblade.com'
  def perform(*args)
    _urls = urls
    _urls.each do |url|
      scrape_page("#{BASE_URL}#{url}")
    end  
    browser.close
  end

  def browser
    @_browser ||= Watir::Browser.new(:firefox)
  end

  def urls
    _urls = []
    browser.goto("#{BASE_URL}/youtube/top/category/howto")
    browser.wait_until(timeout:2) do |browser|
      doc = Nokogiri::HTML.parse(browser.html)
      nodes = doc.css('#top-menu-content-youtube a')
      _urls = nodes.map do |n|
        n['href']
      end
    end 
    _urls 
  end

  def scrape_page(url)
    ScrapeSocialBladePageJob.perform_later(url)
  end


  def wait
    # time = 10 * rand()
    # while (time >= 1)
    #   time = time - 1
    #   puts "#{time}"
    sleep(2)
    # end
  end  
end