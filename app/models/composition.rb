class Composition <ActiveRecord::Base
    belongs_to :list_type
    belongs_to :era

    validates :title, :composer, :instrumentation, presence: true

    def slug
        self.title.gsub(" ", "-").downcase
    end 

    def self.find_by_slug(slug)
        self.all.find{ |instance| instance.slug == slug }
    end

end