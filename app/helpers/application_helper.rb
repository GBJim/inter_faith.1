module ApplicationHelper

  def ransack
  	  @ransack = Post.search(params[:q]) 
  end

  def embed(url)
  	if url.present? and url != ""
  		begin
  			embedly_api = Embedly::API.new 
  			obj = embedly_api.oembed :url => url
  			raw obj[0].marshal_dump[:html]
  		rescue
  			nil
  		end
  	else
  		nil
  	end

  end


end
