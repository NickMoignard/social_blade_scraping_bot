class YtSBListJob < ApplicationJob

  def perform(url)
    
    browser.goto(url)
    browser.wait_until(timeout:2) do |browser|
      doc = Nokogiri::HTML.parse(browser.html)
      channels = doc.css('body > div:nth-child(15) > div:nth-child(2) > div[style*="font-size: 10pt; border-bottom: 1px solid #eee"]')
      data = channels.map do |channel|
        [
          channel.at_css('div:nth-child(2)').try(:text).strip,
          channel.at_css('div:nth-child(3)').try(:text).strip,
          channel.at_css('div:nth-child(4)').try(:text).strip,
          channel.at_css('div:nth-child(5)').try(:text).strip,
          channel.at_css('div:nth-child(6)').try(:text).strip,
          channel.at_css('div:nth-child(3) a')['href']
        ]
      end
      
      data.each do |row|

        @channel = Channel.where({
          :url => row[5]
        }).first_or_create do |channel|
          channel.grade = row[0]
          channel.username = row[1]
          channel.uploads = row[2]
          channel.subs = row[3]
          channel.views = row[4]
          channel.url = row[5]

          channel.save
        end  
      end
      browser.close      
    end
  end
end



