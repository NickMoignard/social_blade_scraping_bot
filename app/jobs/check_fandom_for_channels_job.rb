class CheckFandomForChannelsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    browser.goto('https://youtube.fandom.com/wiki/Category:YouTubers')
    browser.wait_until(timeout:2) do |browser|
      doc = Nokogiri::HTML.parse(brower.html)

      links = doc.css('li.category-page__member:nth-child(40) > a')
      _urls = node.map do |a|
        a['href']
      end

      _urls.each do |url|
        @channel = Channel.where({
          :username => url
        }).first_or_create do |channel|
          channel.username = 
        end
      end
    end
  end

  def browser
    @_browser ||= Watir::Browser.new(:firefox)
  end
end
