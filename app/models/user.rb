class User <ActiveRecord::Base
    has_secure_password

    validates :name, :password_digest, presence: true
    has_many :list_types
    has_many :compositions, through: :list_types
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
