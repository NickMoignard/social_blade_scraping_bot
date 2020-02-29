class InstagramAccountWorker < ApplicationWorker
    sidekiq_options queue: 'low'

    def perform(id)
        instagram_account = InstagramAccount.find(id)
        url = instagram_account.url.split('/')[-1]
        
        browser.goto("https://www.instagram.com/#{url}")
        browser.wait_until(timeout:30) do |b|
            doc = Nokogiri::HTML.parse(b.html)
            
            bio = doc.css('.-vDIg').try(:text).strip
            instagram_account.bio = bio
            instagram_account.save!
        end    
        browser.close
    end
end