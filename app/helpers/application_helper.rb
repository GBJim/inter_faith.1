module ApplicationHelper

  def ransack
  	  @ransack = Post.search(params[:q]) 
  end


end
