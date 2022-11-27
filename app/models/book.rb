# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  source_id  :bigint
#  target_id  :bigint
#
# Indexes
#
#  index_books_on_source_id  (source_id)
#  index_books_on_target_id  (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (source_id => languages.id)
#  fk_rails_...  (target_id => languages.id)
#
class Book < ApplicationRecord
  has_many :translations, dependent: :destroy
  belongs_to :source, class_name: 'Language'
  belongs_to :target, class_name: 'Language'

  validates :name, uniqueness: true, presence: true
end
