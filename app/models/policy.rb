class Policy < ActiveRecord::Base
  has_many :conditions
  has_many :incidents

  def violated?
    conditions.map(&:violated?).any?
  end
end
