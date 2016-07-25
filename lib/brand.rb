class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:capitalize_first_letters)

  private

  define_method(:capitalize_first_letters) do
    self.name=(name().split.map(&:capitalize).join(' '))
  end
end
