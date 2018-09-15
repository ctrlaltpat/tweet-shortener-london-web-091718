def dictionary
  {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  rtn_tweet = tweet.split(" ")
  rtn_tweet.map! {
    |word|
    
    # if dictionary.keys.include?(word.downcase)
    #   dictionary[word.downcase]
    # else
    #   word
    # end
    
    dictionary.keys.include?(word.downcase) ? dictionary[word.downcase] : word
  }
  rtn_tweet.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  # if tweet.split("").count > 140
  #   word_substituter(tweet)
  # else
  #   tweet
  # end
  
  tweet.split("").count > 140 ? word_substituter(tweet) : tweet
end

def shortened_tweet_truncator(tweet)
  rtn_tweet = selective_tweet_shortener(tweet)
  
  # if rtn_tweet.split("").count > 140
  #   rtn_tweet[0..136] + "..."
  # else
  #   rtn_tweet
  # end
  
  rtn_tweet.split("").count > 140 ? rtn_tweet[0..136] + "..." : rtn_tweet
end
