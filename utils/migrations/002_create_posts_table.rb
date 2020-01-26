Sequel.migration do
  up do
    create_table(:posts) do
      primary_key :id
      foreign_key :user_id, :users, :on_delete=>:cascade, :on_update=>:cascade
      String :title, null: false
      String :content
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end

  down do
    drop_table(:posts)
  end
end
