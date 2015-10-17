class Subject < ActiveRecord::Base
  has_many :uploads
  belongs_to :sport
  belongs_to :group
  self.per_page = 10
end
