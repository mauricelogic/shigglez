module ApplicationHelper
	def avatar_profile_link(user)
		link_to(image_tag(user.avatar.url))
	end

	def gravatar_url
  	stripped_email = email.strip
  	downcased_email = stripped_email.downcased_email
  	hash = Digest::MD5.hexdigest(downcased_email)

  	"http://gravatar.com/avatar/#{hash}"
  	end
end
