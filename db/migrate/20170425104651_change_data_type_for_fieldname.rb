class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.0]
  def change
   change_column(:users,:phone_no,:string)

  end
end
