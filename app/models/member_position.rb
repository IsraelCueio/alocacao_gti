class MemberPosition < ApplicationRecord
  belongs_to :member
  belongs_to :position

  after_commit :recalc_member_load

  def recalc_member_load
    member.calc_member_load
  end
end
