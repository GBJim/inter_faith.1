module PostsHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def render_edit_button
   link_to "Edit",edit_post_path(@post), :class => 'btn btn-default' if current_user == @post.user
  end

  def render_delete_button 
  	link_to "Delete",
              post_path(@post),
              :method => 'delete',
              :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },
              :class => 'btn btn-danger' if current_user == @post.user
  end


  def render_new_button
   link_to "Post a new topic", new_post_path, :class => 'new-post btn btn-primary btn-lg', remote: !user_signed_in?
  end

end
