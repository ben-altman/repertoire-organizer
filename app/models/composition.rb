class Composition <ActiveRecord::Base
    belongs_to :list_type
    belongs_to :era

    validates :title, :composer, :instrumentation, presence: true

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
