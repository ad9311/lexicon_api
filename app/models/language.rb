# == Schema Information
#
# Table name: languages
#
#  id            :bigint           not null, primary key
#  abbreviation  :string           not null
#  name          :string           not null
#  special_chars :string           default([]), not null, is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_languages_on_abbreviation  (abbreviation) UNIQUE
#  index_languages_on_name          (name) UNIQUE
#
class Language < ApplicationRecord
  validates :name, :abbreviation, presence: true, uniqueness: true

  has_many :words_as_source, class_name: 'Source'
  has_many :words_as_target, class_name: 'Target'
  has_many :books_as_source, class_name: 'Book', foreign_key: 'source_id'
  has_many :books_as_target, class_name: 'Book', foreign_key: 'target_id'
end
