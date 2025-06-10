class Conduit < ApplicationRecord
    belongs_to :author, class_name: "User"
    validates :title, presence: true
    validates :body, presence: true

    def self.find_by_id_or_slug(identifier)
      record = find_by(id: identifier)
    end
end
