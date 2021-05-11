class Composition <ActiveRecord::Base
    belongs_to :list_type
    belongs_to :era
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
