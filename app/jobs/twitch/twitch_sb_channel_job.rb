class TwitchSBChannelJob < ApplicationJob
  # go to channel page on SB and scrape

  

  def perform(url)
    puts 'To Be Implemented'
  #   browser.goto("#{BASE_URL}#{url}/monthly")
  #   browser.wait_until(timeout:2) do |browser|
  #     doc = Nokogiri::HTML.parse(browser.html)
  #     daily_views = doc.css('#averagedailysubs > span:nth-child(1)').try(:text).strip
  #     daily_subs = doc.css('#averagedailyviews > span:nth-child(1)').try(:text).strip
  #     weekly_subs = doc.css('#socialblade-user-content > div:nth-child(33) > div:nth-child(3) > span:nth-child(1)').try(:text).strip
  #     weekly_views = doc.css('#socialblade-user-content > div:nth-child(33) > div:nth-child(2) > span:nth-child(1)').try(:text).strip
  #     monthly_subs = doc.css('#socialblade-user-content > div:nth-child(34) > div:nth-child(3) > span:nth-child(1)').try(:text).strip
  #     monthly_views = doc.css('#socialblade-user-content > div:nth-child(34) > div:nth-child(2) > span:nth-child(1)').try(:text).strip
  #     yearly_views = doc.css('#socialblade-user-content > div:nth-child(35) > div:nth-child(2) > span:nth-child(1)').try(:text).strip
  #     yearly_subs = doc.css('#socialblade-user-content > div:nth-child(35) > div:nth-child(3) > span:nth-child(1)').try(:text).strip
    
  #   channel = Channel.find_by({
  #     :url => url
  #   }) 

  #     channel.daily_views = daily_views
  #     channel.daily_subs = daily_subs
  #     channel.weekly_views = weekly_views
  #     channel.weekly_subs = weekly_subs
  #     channel.monthly_views = monthly_views
  #     channel.monthly_subs = monthly_subs
  #     channel.yearly_subs = yearly_subs
  #     channel.yearly_views = yearly_views

  #   if channel.save!
  #     puts "#{channel.username} updated!"
  #   else
  #     puts "error"
  #   end
    
  #   browser.close
  #   end
  end
end
 