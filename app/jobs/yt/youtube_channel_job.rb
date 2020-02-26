class YoutubeChannelJob < ApplicationJob
    def perform(username)
        browser.goto("#{YT_BASE_URL}")
    end
end