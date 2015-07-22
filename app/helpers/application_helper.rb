module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def cities
  	@cities = City.all
  end

  def professions
	  @professions = Profession.all
  end

  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    return gravatar_url
  end

  def enum_user_type(type)
    if type == 1
      return "Canditate"
    elsif type == 2
      return "Company"
    elsif type == 3
      return "Backoffice"
    end
  end 
end
