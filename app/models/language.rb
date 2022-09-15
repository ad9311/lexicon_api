# == Schema Information
#
# Table name: languages
#
#  id            :bigint           not null, primary key
#  abbrev        :string
#  name          :string
#  special_chars :string           default("")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_languages_on_abbrev  (abbrev) UNIQUE
#  index_languages_on_name    (name) UNIQUE
#
class Language < ApplicationRecord
  has_many(
    :source_of,
    class_name: :Dictionary,
    foreign_key: :source_id,
    dependent: :destroy,
    inverse_of: :source
  )
  has_many(
    :target_of,
    class_name: :Dictionary,
    foreign_key: :target_id,
    dependent: :destroy,
    inverse_of: :target
  )

  validates :name, presence: true, uniqueness: true
  validates :abbrev, presence: true, uniqueness: true
end
