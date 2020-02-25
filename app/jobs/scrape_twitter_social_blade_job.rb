class ScrapeTwitterSocialBladeJob < ApplicationJob
  queue_as :default

  def browser
    @_browser ||= Watir::Browser.new(:firefox)
  end

  def perform(*args)
    browser.goto('')
    browser.wait_until(timeout:2) do |browser|
      doc = Nokogiri::HTML.parse(browser.html)
      accounts = docs.css()


      



      data = accounts.map do |account|
        [
          account.at_css().try().strip
        ]
      end
      data.each do |row|
        @twitter = Twitter.where({
          :username => row[0]
        }).first_or_create do |twitter|
          twitter.username = row[0]

          twitter.total_tweets = row[1]
          twitter.total_followers = row[2]

        end

      end
      browser.close
    end
  end
end
          # twitter.joined = Datetime.new
          # twitter.bio = 'fasdf'
          # twitter.website = 'dsfa'
          # twitter.avg_retweets = row[]
          # twitter.avg_likes = 9
          # twitter.daily_followers = 1
          # twitter.monthly_followers = 1
          # twitter.daily_tweets = 1