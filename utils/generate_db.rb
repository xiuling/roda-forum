require 'sequel'

DB = Sequel.connect 'sqlite://forum.db'

DB.create_table? :users do
  primary_key :id
  String :name, null: false # 用户name
  String :password, null: false # 用户密码
  String :email, null: false # 用户邮箱
  String :tel
  String :avatar # 头像
  String :wechat
  String :facebook
  String :twitter
  Integer :deleted, default: 0 # 是否已删除 非0为删除
  DateTime :create_at, null: false
  DateTime :update_at, null: false
end

DB.create_table? :posts do
  primary_key :id
  foreign_key :user_id, :users, :on_delete=>:cascade, :on_update=>:cascade
  String :title, null: false
  String :content
  DateTime :create_at, null: false
  DateTime :update_at, null: false
end

DB.create_table? :comments do
  primary_key :id
  foreign_key :user_id, :users, :on_delete=>:cascade, :on_update=>:cascade
  foreign_key :post_id, :posts, :on_delete=>:cascade, :on_update=>:cascade
  Integer :parent_id, default: 0 # 回复的评论id
  String :content, null: false
  DateTime :create_at, null: false
  DateTime :update_at, null: false
end
