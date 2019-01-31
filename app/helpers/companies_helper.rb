module CompaniesHelper
# 返回指定用户的 Gravatar
  def gravatar_for_company(company,  size: 80 )
    gravatar_id = Digest::MD5::hexdigest(company.website.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: company.name, class: "gravatar")
  end

end