class Stashed < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def self.generate_chart_from_data(hash)
    chart_url = "#{hash[:chart_data]}&chtt#{hash[:title]}&chf=bg,s,#{hash[:background_color]}"
  end

end
