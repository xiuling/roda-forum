Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :name, null: false
      String :avatar
      String :email, null: false
      String :tel, null: false
      String :password, null: false
      String :wechat
      String :facebook
      String :twitter
      Integer :deleted, default: 0
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end

  down do
    drop_table(:users)
  end
end
