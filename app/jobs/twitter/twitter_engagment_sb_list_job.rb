class TwitterEngagementSbListJob < ApplicationJob
    def perform(url)
      browser.goto(url)
      browser.wait_until(timeout:2) do |browser|
        doc = Nokogiri::HTML.parse(browser.html)
  
        table = 'body > div.main-container > div.content-container > div.content-module-wide > '
        usernames = doc.css("#{table}div:nth-child(6n+3)").each do |x| x.try(:text).strip end
        total_tweets = doc.css("#{table}div:nth-child(6n+4)").map do |x| x.try(:text).strip.tr(',','').to_i end
        avg_retweets = doc.css("#{table}div:nth-child(6n+5)").map do |x| x.try(:text).strip.tr(',','').to_i end
        avg_likes = doc.css("#{table}div:nth-child(6n+6)").map do |x| x.try(:text).strip.tr(',','').to_i end

        usernames = usernames.zip(total_tweets,total_followers)
        # usernames = usernames.zip(total_followers)
        
        usernames.each do |row|
          @twitter = TwitterAccount.where({
            :handle => row[0]
          }).first_or_create do |t|
            t.handle = row[0]
            t.total_tweets = row[1]
            t.avg_retweets = row[2]
            t.avg_likes = row[3]

          end  
          person = Person.new
          person.social_presence = SocialPresence.new :twitter_account => @twitter
          person.save!
        end
        browser.close      
      end
    end
  end
  
  
  # avg_retweets: integer,
  # avg_likes: integer,
  # daily_followers: integer,
  # monthly_followers: integer,
  # daily_tweets: integer,
  # monthly_tweets: integer,
  
  # joined: datetime,
  # bio: string,
  # website: string
  
  # 