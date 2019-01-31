module JobSeekersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for_job_seeker(job_seeker, size: 80)
    gravatar_id = Digest::MD5::hexdigest(job_seeker.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: job_seeker.name, class: "gravatar")
  end

end
