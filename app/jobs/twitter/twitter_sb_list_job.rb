class TwitterSBListJob < ApplicationJob
  # Scrape a given SB YT_top list


  def perform(url)
    
    browser.goto(url)
    browser.wait_until(timeout:2) do |browser|
      doc = Nokogiri::HTML.parse(browser.html)
      accounts = doc.css('body > div:nth-child(15) > div:nth-child(2) > div[style*="font-size: 10pt; border-bottom: 1px solid #eee"]')
      data = accounts.map do |account|
        [
          account.at_css('div:nth-child(2)').try(:text).strip,
          account.at_css('div:nth-child(3)').try(:text).strip,
          account.at_css('div:nth-child(4)').try(:text).strip,
          account.at_css('div:nth-child(5)').try(:text).strip,
          account.at_css('div:nth-child(6)').try(:text).strip,
          account.at_css('div:nth-child(3) a')['href']
        ]
      end
      
      data.each do |row|
        @twitter = Twitter.where({
          :url => row[5]
        }).first_or_create do |t|
          t.grade = row[0]
          t.username = row[1]
          t.uploads = row[2]
          t.subs = row[3]
          t.views = row[4]
          t.url = row[5]

          t.save
        end  
      end
      browser.close      
    end
  end
end


