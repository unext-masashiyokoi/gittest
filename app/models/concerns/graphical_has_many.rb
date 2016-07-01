module GraphicalHasMany
  extend ActiveSupport::Concern

  module ClassMethods
    def graphical_has_many(name)
      has_many name                , dependent: :delete_all
      has_many :"#{name}_as_target", dependent: :delete_all, class_name: 'User', foreign_key: 'target_user_id'
    end
  end
end
