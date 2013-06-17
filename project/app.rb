# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'erb'
require 'twitter'
require 'uri'
require './util'

# ツイートを取得する (Twitter Search API利用)
def getTweet(q, lat, lng)
  # OAuth情報をセットしたクライアントを生成
  client = Twitter::Client.new(
    :consumer_key => "YOUR_CONSUMER_KEY",
    :consumer_secret => "YOUR_CONSUMER_SECRET",
    :oauth_token => "YOUR_ACCESS_TOKEN",
    :oauth_token_secret => "YOUR_ACCESS_TOKEN_SECRET"
  )

  # Twitter Search API にアクセス  
  res = client.search(URI.encode(q), {:geocode => "#{lat},#{lng},30km", :count => 100})
  
  # GEOデータを持っているツイートのみを整形して返す
  statuses = Array.new
  res.statuses.each do |tw|
    if tw.geo != nil then
      statuses.push({
        :id => tw.id, :text => htmlEscape(tw.text), :created_at => tw.created_at,
        :name => htmlEscape(tw.user.name), :screen_name => htmlEscape(tw.user.screen_name),
        :profile_image => tw.user.profile_image_url,
        :lat => tw.geo.coordinates[0], :lng => tw.geo.coordinates[1],
        :emb => embedTweet(tw)
      })
    end
  end
  
  return statuses
end

# トップへのアクセス (views/index.erb 利用)
get '/' do
  @q = "駅"
  @lat = 35.691914
  @lng = 139.70034
  @tweets = getTweet(@q, @lat, @lng)
  erb :index
end

# tweets へのアクセス (views/tweets.erb 利用)
get '/tweets' do
  @q = "駅"
  @lat = 35.691914
  @lng = 139.70034
  @tweets = getTweet(@q, @lat, @lng)
  erb :tweets
end
