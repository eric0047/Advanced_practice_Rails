class GoodJobLog < ApplicationRecord
  belongs_to :employee, counter_cache: true
end
