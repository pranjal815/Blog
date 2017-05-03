module Blog
  class PostsController < BlogController

    # GET /posts
    # GET /posts.json
    def index
     @posts = Post.all
     if params[:search]
       @posts = Post.search(params[:search]).order("created_at DESC")
     else
       @posts = Post.all.order("created_at DESC")
      end
    end

     #For pagination include below to work
     #def index
     # @posts = storage.list_for(params[:page], params[:tag])
    #end
    # GET /posts/1
    # GET /posts/1.json

     def show
      @post = storage.friendly.find(params[:id])
    end

    private

    def storage
      Post.published
    end

  end

end