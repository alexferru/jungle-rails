class Sale < ApplicationRecord
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    ends_on && ends_on < Date.current
  end

  def upcoming?
    starts_on && starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end
end
