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
    #ForumModel::Posts.get(:id, :title, :create_at, :update_at).join(users, id: :user_id).reverse_order(:update_at).limit(20)
    ForumModel::Posts.select(:id, :title, :created_at, :updated_at).reverse_order(:updated_at).limit(20).all
  end
  def self.add_post(title, content, user_id)
    ForumModel::Posts.create(
      title: title,
      content: content,
      user_id: user_id
    )
  end
  def self.get_post(id)
    ForumModel::Posts.where(id: id).first
  end
end
