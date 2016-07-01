class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'
end
