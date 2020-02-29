class InstagramAccountJob < ApplicationJob

    INSTAGRAM_URL = 'https://www.instagram.com'

    def perform(instagram_account)
        
        url = instagram_account.url.split('/')[-1]
        
        browser.goto("#{INSTAGRAM_URL}/#{url}")
        browser.wait_until(timeout:2) do |b|
            doc = Nokogiri::HTML.parse(b.html)
            bio = doc.css('.-vDIg').try(:text).strip
            instagram_account.bio = bio
            instagram_account.save!
            browser.close
        end    
    end
end