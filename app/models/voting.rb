class Voting < ActiveRecord::Base
  belongs_to :voteable
end
