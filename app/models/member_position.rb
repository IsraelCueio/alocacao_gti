class MemberPosition < ApplicationRecord
  belongs_to :member
  belongs_to :position

  after_destroy :recalc_member_load
  after_create :recalc_member_load
  
  def recalc_member_load
    member.calc_member_load
  end
end
