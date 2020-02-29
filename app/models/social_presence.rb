class SocialPresence < ApplicationRecord
    belongs_to :person
    has_one :instagram_account
    has_one :twitter_account
    has_one :youtube_channel
    has_one :twitch_channel

end
