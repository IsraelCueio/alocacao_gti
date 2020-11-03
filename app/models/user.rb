class User < ApplicationRecord
  after_create :build_enterprise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :enterprise

  private

  def build_enterprise
    Enterprise.create(user: self)
  end
end
