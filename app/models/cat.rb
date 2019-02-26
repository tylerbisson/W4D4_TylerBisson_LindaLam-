require 'action_view'
require 'action_view/helpers'

class Cat < ApplicationRecord 
  include ActionView::Helpers::DateHelper
  validates :birth_date, :color, :name, presence: true 
  validates :sex, inclusion: ['m', 'f']
  validates :color, inclusion: ['orange', 'black', 'white']

  def age
   @cat_age = Date.today.year - self.birth_date.year
   @cat_age
  end
end 