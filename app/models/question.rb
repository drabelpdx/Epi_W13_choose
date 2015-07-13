class Question < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  validates_presence_of :option_a
  validates_presence_of :option_b

end
