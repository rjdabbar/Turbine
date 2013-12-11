class User < ActiveRecord::Base
  has_one :profile
  has_many :friends

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
    end

  end

end

