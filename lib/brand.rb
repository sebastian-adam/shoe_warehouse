class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save(:capitalize_first_letter)

  private

  def capitalize_first_letter
    self.name = self.split.map{ |i| i.capitalize }.join(' ')
  end
end