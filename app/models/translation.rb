# == Schema Information
#
# Table name: translations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  source_id  :bigint           not null
#  target_id  :bigint           not null
#
# Indexes
#
#  index_translations_on_book_id    (book_id)
#  index_translations_on_source_id  (source_id)
#  index_translations_on_target_id  (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (source_id => sources.id)
#  fk_rails_...  (target_id => targets.id)
#
class Translation < ApplicationRecord
  belongs_to :book
  belongs_to :source
  belongs_to :target
end
