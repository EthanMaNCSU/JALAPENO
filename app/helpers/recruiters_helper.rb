module RecruitersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for_recruiter(recruiter, size: 80)
    gravatar_id = Digest::MD5::hexdigest(recruiter.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: recruiter.name, class: "gravatar")
  end
end
