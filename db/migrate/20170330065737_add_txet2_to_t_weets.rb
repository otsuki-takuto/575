class AddTxet2ToTWeets < ActiveRecord::Migration
  def change
    add_column :tweets, :text2, :text
    add_column :tweets, :text3, :text
  end
end
