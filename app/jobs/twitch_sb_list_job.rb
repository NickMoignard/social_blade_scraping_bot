class TwitchSbListJob < ApplicationJob
  def perform(url)
    browser.goto(url)
    browser.wait_until(timeout:2) do |browser|
      doc = Nokogiri::HTML.parse(browser.html)

      table = 'body > div.main-container > div.content-container > div.content-module-wide > '
      usernames = doc.css("#{table}div:nth-child(5n+3)").map do |x| x.try(:text).strip end
      total_followers = doc.css("#{table}div:nth-child(5n+4)").map do |x| x.try(:text).strip.tr(',','').to_i end
      total_views = doc.css("#{table}div:nth-child(5n+5)").map do |x| x.try(:text).strip.tr(',','').to_i end
      usernames = usernames.zip(total_followers, total_views)

      usernames.each do |row|
        @twitch = TwitchChannel.where({
          :username => row[0]
        }).first_or_create do |t|
          t.username = row[0]
          t.total_followers = row[1]
          t.total_views = row[2]

          t.save
        end  
      end
      browser.close      
    end
  end
end

