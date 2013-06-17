# encoding: UTF-8

# HTMLエスケープ処理を行う関数
def htmlEscape(str)
  return str.gsub("&", "&amp;").gsub("'", "&apos;").gsub("\"", "&quot;").gsub("<","&lt;").gsub(">","&gt;")
end

# ツイートをディスプレイガイドライン準拠表示に整形する関数
def embedTweet(tw)
  name = htmlEscape(tw.user.name)
  screen_name = htmlEscape(tw.user.screen_name)
  
  text = htmlEscape(tw.text)
  text.gsub!(/\n+/, "<br>")
  text.gsub!(/(https?:\/\/t.co\/[a-zA-Z0-9]+)/, '<a href="\1">\1</a>')
  text.gsub!(/@([a-zA-Z0-9_]+)/, '<a href="http://twitter.com/\1/">@\1</a>')
  text.gsub!(/#([^ ]+)/, '<a href="http://search.twitter.com/?q=%23\1">#\1</a>')

  emb = ""
  emb += "<div id=\"content\"><div id=\"siteNotice\"></div><div id=\"bodyContent\">"
  emb += "<div class=\"tw\">"
  emb += "<div class=\"tw_user\"><a href=\"http://twitter.com/#{screen_name}/\">"
  emb += "<div class=\"tw_profile_image\"><img src=\"#{tw.user.profile_image_url}\"></div>"
  emb += "<div class=\"tw_name\">#{name}</div>"
  emb += "<div class=\"tw_screen_name\">@#{screen_name}</div>"
  emb += "</a></div>"
  emb += "<div class=\"tw_text\">"
  emb += "#{text}"
  emb += "</div>"
  emb += "<div class=\"tw_created_at\">"
  emb += "<a href=\"http://twitter.com/#{screen_name}/status/#{tw.id}\">#{tw.created_at}</a>"
  emb += "</div>"
  emb += "<div class=\"tw_action\"><a href=\"https://twitter.com/intent/tweet?in_reply_to=#{tw.id}\">返信</a>"
  emb += "&nbsp;/&nbsp;"
  emb += "<a href=\"https://twitter.com/intent/retweet?tweet_id=#{tw.id}\">リツイート</a>"
  emb += "&nbsp;/&nbsp;"
  emb += "<a href=\"https://twitter.com/intent/favorite?tweet_id=#{tw.id}\">お気に入り</a>"
  emb += "</div>"
  emb += "</div>"
  emb += "</div>"
  emb += "</div>"

  return emb
end
