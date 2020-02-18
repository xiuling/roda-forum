require_relative '../utils/forum_model'

module DbService
  def self.reg(name, pass, email)
    user = ForumModel::Users.where(name: name).first
    if user.nil?
      ForumModel::Users.create(
        name: name,
        password: pass,
        email: email
      )
    end
  end
  def self.login(name, pass)
    ForumModel::Users.where(name: name, password: pass).first
  end
  def self.get_all_posts
    ForumModel.get_all_posts
  end
  def self.add_post(title, content, user_id)
    ForumModel::Posts.create(
      title: title,
      content: content,
      user_id: user_id
    )
  end
  def self.get_post(id)
    post = ForumModel::Posts.where(id: id).first
    post[:comments] = ForumModel.get_comments_by_postId(id)
    return post
  end
  def self.add_post_comment(content, post_id, parent_id, user_id)
    ForumModel::Comments.create(
      content: content,
      post_id: post_id,
      parent_id: parent_id,
      user_id: user_id
    )
  end
end
