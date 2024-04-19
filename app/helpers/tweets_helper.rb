module TweetsHelper
  def create_tweet_btn
    out = ''
    if user_signed_in?
      out << link_to('New Tweet', new_tweet_path, data: { turbo_frame: dom_id(Tweet.new) }, class: 'btn yellow-btn')
    end
    out.html_safe
  end

  def action_btn(tweet)
    out = ''
    if user_signed_in? && current_user.id == tweet.user.id
      out << link_to('Edit', edit_tweet_path(tweet), class: "btn green-btn me-2")
      out << link_to('Delete', tweet_path(tweet), data: { turbo_method: :delete, confirm: 'Are you sure?' }, class: "btn red-btn")
    end
    out.html_safe
  end

  def get_tweet_post(tweet)
    if tweet.tweet_post.attached?
      case attachment_type(tweet)
      when "image/png"
        image_tag(tweet.tweet_post)
      when "image/jpeg"
        image_tag(tweet.tweet_post)
      when "video/mp4"
        video_tag(tweet.tweet_post, controls: true)
      end
    end
  end

  private

  def attachment_type(tweet)
    tweet.tweet_post_blob.content_type
  end
end
