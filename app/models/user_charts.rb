class UserCharts < ActiveRecord::Base
  belongs_to :user


  def self.add_chart(url, user_id)
    create! do |chart|
      chart.link = url
      chart.user_id = user_id
    end
  end

end
