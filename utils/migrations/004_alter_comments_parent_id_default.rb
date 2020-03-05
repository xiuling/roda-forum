Sequel.migration do
  up do
    alter_table(:comments) do
      set_column_default :parent_id, 0
    end
  end

  down do
    alter_table(:comments) do
      set_column_default :parent_id, nil
    end
  end
end
