class Incident < ActiveRecord::Base
  belongs_to :policy

  def resolved?
    resolved_at.present?
  end
end
