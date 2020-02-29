class ApplicationWorker
  include Sidekiq::Worker

  SB_BASE_URL = 'https://socialblade.com'
  YT_BASE_URL = 'https://www.youtube.com'
  TWITCH_BASE_URL = 'https://www.twitch.tv'
  TWITTER_BASE_URL = 'https://www.twitter.com'
  INSTA_BASE_URL = 'https://www.instagram.com'
  SOCIAL_BLADE_TOP_YOUTUBE_LISTS_DIV = '<div class="top-menu-content" id="top-menu-content-youtube" style="width: 950px; float: left; display: block;"> <div style="width: 225px; float: left;"> <h2 class="top-menu-top-charts-header">YouTube Top Charts</h2> <div class="top-menu-top-charts-content"><a href="/youtube/top/50">Top 50 YouTubers</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/100">Top 100 YouTube Channels</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/500">Top 500 YouTube Channels</a></div><div class="top-menu-top-charts-content" style="margin-top: 8px;"><a href="/youtube/top/trending/top-500-channels-30-days/most-subscribed">Top 500 YouTubers (30 Days)</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/trending/top-500-channels-1-day/most-subscribed">Top 500 YouTubers (1 Day)</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/trending/bottom-500-channels-30-days/most-unsubscribed">Worst 500 YouTubers (30 Days)</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/trending/bottom-500-channels-1-day/most-unsubscribed">Worst 500 YouTubers (1 Day)</a></div><div class="top-menu-top-charts-content" style="margin-top: 16px;"><a href="/youtube/top/category/made-for-kids">Top "Made for Kids" YouTube Creators</a></div></div><div style="width: 240px; float: left; margin-left: 30px;"> <h2 class="top-menu-top-charts-header">YouTube Popular Countries</h2> <div class="top-menu-top-charts-content"><a href="/youtube/top/country/US">Top 250 from United States</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/country/GB">Top 250 from United Kingdom</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/country/AU">Top 250 from Australia</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/country/CA">Top 250 from Canada</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/country/DE">Top 250 from Germany</a></div></div><div style="width: 200px; float: left; margin-left: 20px;"> <h2 class="top-menu-top-charts-header">YouTube Top Categories</h2> <div class="top-menu-top-charts-content"><a href="/youtube/top/category/autos">Autos &amp; Vehicles</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/comedy">Comedy</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/education">Education</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/entertainment">Entertainment</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/film">Film</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/games">Gaming</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/tech">Science &amp; Technology</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/shows">Shows</a></div></div><div style="width: 200px; float: left;"> <br><div class="top-menu-top-charts-content"><a href="/youtube/top/category/howto">How to &amp; Style</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/music">Music</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/news">News &amp; Politics</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/nonprofit">Nonprofit &amp; Activism</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/people">People &amp; Blogs</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/animals">Pets &amp; Animals</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/sports">Sports</a></div><div class="top-menu-top-charts-content"><a href="/youtube/top/category/travel">Travel</a></div></div></div>'  

  def browser
    @_browser ||= Watir::Browser.new :firefox, headless: true
  end

  def wait
    # human length of time to wait
    time = 2 * rand()
    while (time >= 1)
      time = time - 1
      puts "#{time}"
    end
  end 
end
