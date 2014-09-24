class PostsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy,:vote]

  before_action :set_post, only: [:show, :edit, :update, :destroy, :vote]
  before_action :validate_user, only: [:edit, :update, :destroy]
  after_action :create_embedly, only:[:create, :update]
  # GET /posts
  # GET /posts.json




  def index
    @religions = Religion.all

    if params[:religion_id].present?
      @posts = Religion.find(params[:religion_id]).posts
      #@posts = Post.all
    elsif params[:q].present?
      @posts = Post.search(params[:q]).result
    elsif params[:tag].present?
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post
    #@posts = Post.all
    end
    @posts_size = @posts.all.size
    @users_size = User.all.size
    @posts = @posts.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { #render plain: params
        redirect_to @post, notice: 'Post was successfully updated.' 
      }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "dislike"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end
   
    @post.vote_by voter: current_user, vote: direction
  
    respond_to do |format|
      format.js


    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.

    def create_embedly
      @post.embedder ||= Embedder.new
      link = @post.embedder
      embedly_api = Embedly::API.new :key => Settings.embedly.key
      embedly_objs = embedly_api.oembed(:url => @post.url)
      embedly_obj = embedly_objs[0]
      response_data = embedly_obj.marshal_dump
      link.favicon_url       =  response_data[:favicon_url]
      link.title             =  response_data[:title]
      link.author_name       =  response_data[:author_name]
      link.author_url        =  response_data[:author_url]
      link.provider_name     =  response_data[:provider_name]
      link.provider_url      =  response_data[:provider_url]
      link.resource_type              =  response_data[:type]
      link.thumbnail_url     =  response_data[:thumbnail_url]
      link.thumbnail_width   =  response_data[:thumbnail_width]
      link.thumbnail_height  =  response_data[:thumbnail_height]
      link.html              =  response_data[:html]
      
      link.width             =  response_data[:width]
      link.height            =  response_data[:height]
      link.save



    end





    def validate_user
      unless @post.user.id == current_user.id
        begin
          redirect_to(:back, :status => 301, flash: {error: "Sorry. You can not edit or delete this story because you are not the author"})

        rescue ActionController::RedirectBackError
          redirect_to(root_path)
        end
      end
    end
    
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :url, :user_id, :tag_list, religion_ids: [] )
    end
end
