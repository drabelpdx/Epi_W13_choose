class Question < ActiveRecord::Base
  validates_presence_of :option_a
  validates_presence_of :option_b

  has_many :votings, as: :voteable

  def show_votes_a
    upvotes = self.votings.where("up_vote = true").length
    return upvotes
  end

end
