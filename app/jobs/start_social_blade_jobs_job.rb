class StartSocialBladeJobsJob < ApplicationJob
  # Scrape SB for navigation links

  
  def perform(*args)
    puts social_blade_urls
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
      'https://socialblade.com/twitter/top/100',
      'https://socialblade.com/twitter/top/100/tweets',
      'https://socialblade.com/twitter/top/100/engagements'
    ]
    twitch_urls = [
      'https://socialblade.com/twitch/top/500',
      'https://socialblade.com/twitch/top/500/channelviews'
    ]
    instagram_urls= [
      'https://socialblade.com/instagram/top/100/followers',
      'https://socialblade.com/instagram/top/100/media'
    ]  
    youtube_base_urls = [
      'https://socialblade.com/youtube/top/500',
      'https://socialblade.com/youtube/top/trending/top-500-channels-1-day/most-subscribed',
      'https://socialblade.com/youtube/top/category/made-for-kids'
    ]

    return _urls + twitch_urls + twitter_urls + instagram_urls + youtube_base_urls
  end  

end