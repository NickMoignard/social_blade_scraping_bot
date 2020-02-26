class TwitterAccountJob < ApplicationJob

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
