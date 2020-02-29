class YoutubeChannelWorker < ApplicationWorker
    sidekiq_options queue: 'low'

    def perform(id)
        # youtube_channel = YoutubeChannel.find(id)
        # url = youtube_channel.url.split('/')[-1]
        



        # browser.goto("https://www.youtube.com/user/#{url}/about")
        # browser.wait_until(timeout:30) do |b|
        #     doc = Nokogiri::HTML.parse(b.html)
        #     # links: [:string]
        #     # description: :text
        #     # details: { 
        #     #   location => :string
        #     # }
        #     # stats: {
        #     #   joined => :string
        #     #   views => :integer
        #     # }


        #     binding.pry
        #     bio = doc.css('.-vDIg').try(:text).strip
        #     youtube_channel.bio = bio
        #     youtube_channel.save!
        # end    
        # browser.close
    end
end