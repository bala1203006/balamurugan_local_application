class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.0]
  def change
     change_column :users,:phone_no,:string,limit: 12 
  end
end
