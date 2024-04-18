module TweetsHelper
  def create_tweet_btn
    out = ''
    if user_signed_in?
      out << link_to('New Tweet', new_tweet_path, class: 'btn yellow-btn')
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
end
