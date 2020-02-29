class StartSocialBladeWorker < ApplicationWorker
  # Scrape SB for navigation links

  
  def perform(*args)
    social_blade_urls.each do |url|
      
      case url
      when /twitter/
        TwitterSbListWorker.perform_async(url)  
      when /engagements/
        TwitterEngagementSbListWorker.perform_async(url)
      when /twitch/
        TwitchSbListWorker.perform_async(url)
      when /youtube/
        YtSbListWorker.perform_async(url)
      when /instagram/
        InstaSbListWorker.perform_async(url)
      else
        puts "An error occured trying: #{url}"      
      end    
    end
  end

  
  def social_blade_urls
    doc = Nokogiri::HTML.parse(SOCIAL_BLADE_TOP_YOUTUBE_LISTS_DIV)
    country_nodes = doc.css('#top-menu-content-youtube > div:nth-child(2) > div a')
    category_nodes_1 = doc.css('#top-menu-content-youtube > div:nth-child(3) > div a')
    category_nodes_2 = doc.css('#top-menu-content-youtube > div:nth-child(4) > div a')
    nodes = country_nodes + category_nodes_1 + category_nodes_2
    _urls = nodes.map do |n|
      n['href']
    end
     
    twitter_urls = [
      '/twitter/top/100',
      '/twitter/top/100/tweets',
      '/twitter/top/100/engagements'
    ]
    twitch_urls = [
      '/twitch/top/500',
      '/twitch/top/500/channelviews'
    ]
    instagram_urls= [
      '/instagram/top/100/followers',
      '/instagram/top/100/media'
    ]  
    youtube_base_urls = [
      '/youtube/top/500',
      '/youtube/top/trending/top-500-channels-1-day/most-subscribed',
      '/youtube/top/category/made-for-kids'
    ]

    return (twitter_urls + instagram_urls + twitch_urls + youtube_base_urls + _urls).map do |url_stub|
      "https://socialblade.com#{url_stub}"
    end  
  end  

end