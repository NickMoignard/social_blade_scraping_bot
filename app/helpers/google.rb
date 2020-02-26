class GoogleHelper
    # TODO
    whitelist = [  # scrapeble sites
        'www.youtube.com',
        'www.instagram.com',
        'www.twitch.com',
        'www.twitter.com',
        'www.reddit.com'
    ]
    
    # search with string
    #     all
    #         follow all whitelisted links in results
    #     images
    #         download images for influencer if none exist
    #     news
    #         save results, taking note of article urls for future NLP
    
    # GoogleSearchResult < ActiveModel
    #     image, news or all type

    # Influencer has many GoogleSearchResults
    #  needs column for google_search_results:integer google_news_results:integer

    
end