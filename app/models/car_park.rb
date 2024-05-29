class CarPark < ApplicationRecord
  belongs_to :data_provider

  include PgSearch::Model
  pg_search_scope :search_by_details,
                  against: [:name, :address],
                  associated_against: {
                    data_provider: [:name],
                  },
                  using: {
                    trigram: { threshold: 0.1 },
                    tsearch: { prefix: true, dictionary: "english" }
                  }
end
