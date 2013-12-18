class User < ActiveRecord::Base
  has_one :profile
  has_many :friends
  has_many :games
  has_many :stats, through: :games
  has_many :achievements, through: :games

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
    end

  end

end

