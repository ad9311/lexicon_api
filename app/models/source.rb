# == Schema Information
#
# Table name: sources
#
#  id          :bigint           not null, primary key
#  word        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :bigint           not null
#
# Indexes
#
#  index_sources_on_language_id  (language_id)
#
# Foreign Keys
#
#  fk_rails_...  (language_id => languages.id)
#
class Source < ApplicationRecord
  belongs_to :language
  has_many :translations
end
