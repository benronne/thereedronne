class Createquestionstable < ActiveRecord::Migration
  def up
  	create_table :questions do |q|
  		q.string :name
  		q.string :email
  		q.string :question_text
  		q.datetime :created_at
	end  
  end

  def down
  	drop_table :questions
  end
end
