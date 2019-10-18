class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}
  end

end
