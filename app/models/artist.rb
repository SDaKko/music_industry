class Artist < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true
  validates :pseudonym, uniqueness: true, allow_blank: true

  has_many :albums, dependent: :destroy

  def full_name
    [surname, name, patronymic].compact.join(' ')
  end

  def formatted_name
    pseudonym.presence || full_name
  end

end
