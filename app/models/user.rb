class User <ActiveRecord::Base
    has_many :list_types
    has_many :compositions, through: :list_types
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
