module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def is_admin?
    current_user && current_user.is_admin?
  end

  def title title
    content_for(:title){ raw "#{title} - "}
  end
end
