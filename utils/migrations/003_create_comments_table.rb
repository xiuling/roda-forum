Sequel.migration do
  up do
    create_table(:comments) do
      primary_key :id
      foreign_key :user_id, :users, :on_delete=>:cascade, :on_update=>:cascade
      foreign_key :post_id, :posts, :on_delete=>:cascade, :on_update=>:cascade
      Integer :parent_id # 回复的评论id
      String :content, null: false
      DateTime :create_time, null: false
      DateTime :update_time, null: false
    end
  end

  down do
    drop_table(:comments)
  end
end
