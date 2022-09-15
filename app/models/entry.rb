# == Schema Information
#
# Table name: entries
#
#  id            :bigint           not null, primary key
#  classif       :integer
#  gender        :integer
#  source        :string
#  target        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  dictionary_id :bigint           not null
#
# Indexes
#
#  index_entries_on_dictionary_id  (dictionary_id)
#
# Foreign Keys
#
#  fk_rails_...  (dictionary_id => dictionaries.id)
#
class Entry < ApplicationRecord
  belongs_to :dictionary

  validates :source, :target, presence: true

  enum gender: { female: 0, male: 1, neutral: 2, genderless: 3 }
  enum classif: {
    adjetive: 0,
    adverb: 1,
    conjunction: 2,
    determiner: 3,
    interjection: 4,
    noun: 5,
    preposition: 6,
    pronoun: 7,
    verb: 8
  }
end
