# frozen_string_literal: true

class FunsController < ApplicationController
  def dashboard
    titles, views = Post.common.pluck(:title, :views_count).transpose
    titles.each { |title| title.slice!(10..-1) }
    @chartdata = {
      labels: titles,
      datasets: [{
          label: 'Views',
          backgroundColor: '#badb00',
          barThickness: 'flex',
          data: views
      }]
    }
  end

  def vuejs; end

  def caro; end
end
