module Controllers

  class Posts
    def index
      @posts = Post.all
      puts @posts.inspect
    end
  end

  class Post
    def self.all
      [
        { title: "First post" },
        { title: "Second post"  }
      ]
    end
  end

end

controller = Controllers::Posts.new
controller.index
