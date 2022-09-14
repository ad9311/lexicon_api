# == Schema Information
#
# Table name: dictionaries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  source_id  :integer
#  target_id  :integer
#
# Indexes
#
#  index_dictionaries_on_name       (name) UNIQUE
#  index_dictionaries_on_source_id  (source_id)
#  index_dictionaries_on_target_id  (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (source_id => languages.id)
#  fk_rails_...  (target_id => languages.id)
#
class Dictionary < ApplicationRecord
  belongs_to :source, class_name: :Language
  belongs_to :target, class_name: :Language

  validates :name, presence: true, uniqueness: true
end
