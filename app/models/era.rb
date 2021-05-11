class Era <ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end