class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :mom_fname
      t.string :mom_lname
      t.string :dad_name
      t.string :dad_name
      t.string :email_id
      t.string :contact
      t.string :login_id
      t.string :password

      t.timestamps null: false
    end
  end
end
