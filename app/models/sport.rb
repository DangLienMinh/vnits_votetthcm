class Sport < ActiveRecord::Base
  has_many :subjects
  self.per_page = 10
end
