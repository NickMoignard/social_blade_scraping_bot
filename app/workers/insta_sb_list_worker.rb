class InstaSbListWorker < ApplicationWorker

  sidekiq_options queue: 'critical'
  # Scrape a given SB YT_top list
  def perform(url)
    browser.goto(url)
    browser.wait_until(timeout:2) do |browser|
      doc = Nokogiri::HTML.parse(browser.html)
      browser.close
      channels = doc.css('body > div:nth-child(15) > div:nth-child(2) > div[style*="font-size: 10pt; border-bottom: 1px solid #eee"]')
      data = channels.map do |channel|
        [
          channel.at_css('div:nth-child(3)').try(:text).strip,
          channel.at_css('div:nth-child(4)').try(:text).strip.tr(',', '').to_i,
          channel.at_css('div:nth-child(5)').try(:text).strip.tr(',', '').to_i,
          channel.at_css('div:nth-child(3) a')['href']
        ]
      end
      
      data.each do |row|




        @account = InstagramAccount.where({
          :handle => row[0]
        }).first_or_create do |i|
          i.handle = row[0]
          i.total_posts = row[1]
          i.total_followers = row[2]
          i.url = row[3]
        end
        
        person = Person.new
        person.social_presence = SocialPresence.new :instagram_account => @account
        if person.save!
          InstagramAccountWorker.perform_async(@account.id)
        end
      end      
    end
  end
end