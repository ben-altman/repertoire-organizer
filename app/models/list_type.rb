class ListType <ActiveRecord::Base
    has_many :compositions
    belongs_to :user
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
