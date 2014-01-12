class Stashed < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def self.generate_chart_from_data(hash)
    color = hash[:background_color].reverse.chomp("#").reverse
    data = hash[:chart_data].reverse.chop.chop.chop.chop.chop.chop.chop.chop.chop.chop.reverse.chop.chop
    chart_url = "#{data}&chtt=#{hash[:title]}&chf=bg,s,#{color}"
  end

end
