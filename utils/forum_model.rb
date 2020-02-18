require 'sequel'

Db = Sequel.connect("sqlite://forum.db")
module ForumModel

  def self.get_all_posts
    Db["select posts.id, posts.title, posts.updated_at, users.name from posts inner join users on posts.user_id=users.id order by posts.updated_at desc limit 20"]
  end
  def self.get_comments_by_postId(id)
    Db["select comments.id, comments.content, comments.updated_at, users.name from comments inner join users on comments.user_id=users.id order by comments.updated_at desc limit 20"]
  end
  class Users < Sequel::Model
    one_to_many :posts
    one_to_many :comments

    def before_create
      super
      self.created_at = Time.now
      self.updated_at = self.created_at
    end

    def before_update
      super
      self.updated_at = Time.now
    end
  end

  class Posts < Sequel::Model
    many_to_one :users
    one_to_many :comments

    def before_create
      super
      self.created_at = Time.now
      self.updated_at = self.created_at
    end

    def before_update
      super
      self.updated_at = Time.now
    end
  end

  class Comments < Sequel::Model
    many_to_one :posts
    many_to_one :users

    def before_create
      super
      self.created_at = Time.now
      self.updated_at = self.created_at
    end

    def before_update
      super
      self.updated_at = Time.now
    end
  end

end
