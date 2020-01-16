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
end
