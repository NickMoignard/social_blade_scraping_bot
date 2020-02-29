class TwitterAccountWorker < ApplicationWorker

  sidekiq_options queue: 'low'
  # def browser
  #   @_browser ||= Watir::Browser.new(:firefox)
  # end
  def perform(id)
    twitter_account = TwitterAccount.find(id)
    # twitter_account_handle = twitter_account.handle
    
    browser.goto("https://www.twitter.com/#{twitter_account.handle}")
    # sleep 2
    browser.wait_until(timeout:30) do |b|
      doc = Nokogiri::HTML.parse(b.html)
      
      links = doc.xpath('//*[@id="react-root"]/div/div/div/main/div/div/div/div/div/div/div/div/div[1]/div/div[4]/div/a').map do |a|
        a.try(:text).strip
      end

      # infos = doc.xpath('//*[@id="react-root"]/div/div/div/main/div/div/div/div/div/div/div/div/div[1]/div/div[4]/div/span').map do |span|
      #   span.try(:text).strip
      # end  

      # bio = doc.xpath('//*[@id="react-root"]/div/div/div/main/div/div/div/div/div/div/div/div/div[1]/div/div[3]/div').try(:text).strip

      twitter_account.website = links.first
      twitter_account.bio = doc.xpath('//*[@id="react-root"]/div/div/div/main/div/div/div/div/div/div/div/div/div[1]/div/div[3]/div').try(:text).strip

      # binding.pry
      
      # infos.each do |info|
      #   # puts info
      #   case info
      #   when /,/
      #     twitter_account.location = info
      #   when /Born/
      #     twitter_account.birthday = info
      #   when /Joined/
      #     twitter_account.joined_string = info
      #   else
      #     puts "hmmm #{info}. dont know how to save that"
      #     break
      #   end
      # end  
      if twitter_account.save!
        puts "#{twitter_account.location} | #{twitter_account.bio} | #{twitter_account.birthday} | #{twitter_account.joined_string} | #{twitter_account.website}"
        # browser.close
      else
        puts "BRUH"
      end
    end
    browser.close      
  end
end
          # twitter.joined = Datetime.new
          # twitter.bio = 'fasdf'
          # twitter.website = 'dsfa'
