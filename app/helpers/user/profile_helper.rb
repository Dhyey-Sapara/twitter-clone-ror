module User::ProfileHelper
  def following?(user)
    if user&.followers&.include?(current_user)
      true
    else
      false
    end
  end
end
