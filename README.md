# README
This Rails Application observes Social Blade Top Lists for new and upcoming influencers and then saves them to a PostgreSQL database.

This project is still in the early stages of development. 

* Deployment instructions
    This repo only works locally currently. I will containerize this application very soon
    
* Ruby version
    2.6.3

* System dependencies
    ```
    PostgreSQL '=> 9.0.7'
    Sidekiq
    Redis
    Firefox & Geckodriver in path


* Configuration
    ```
    createuser nlm with password dingo

* Database creation
    ```
    rails db:create
    rails db:migrate

* Database initialization
    ```
    *with sidekiq and redis running
    rails db:seed

* Services (job queues, cache servers, search engines, etc.)
    ```
    StartSocialBladeJobsWorker
        - InstagramSBListWorker (top 100)
            - InstagramAccountWorker (instgram.com/account)
        - TwitchSBListWorker (top 500)
            - TwitchChannelWorker (twitch.tv/channel)
        - TwitterSBListWorker (top 100)
            - TwitterAccountWorker (twitter.com/account)
        - YoutubeSBListWorker (socialblade.com top 500 + categories + countries)
            - YoutubeChannelWorker (youtube.com/channel)



