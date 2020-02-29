class Person < ApplicationRecord
    has_one :social_presence
    has_one :twitch_channel, :through => :social_presence
    has_one :youtube_channel, :through => :social_presence
    has_one :twitter_account, :through => :social_presence
    has_one :instagram_account, :through => :social_presence
end
