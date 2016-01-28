class Attendance < ActiveRecord::Base
  belongs_to :event
  belongs_to :membership
  has_one :user, through: :membership

  has_one :cohort, through: :event

  scope :unmarked, -> { where(status: nil)}
  scope :due, -> { includes(:event).references(:event).where("events.occurred_at <= ?", DateTime.now)}
  scope :todo, -> { due.unmarked }
  scope :self_takeable, -> {unmarked.joins(:event).where("events.date < ? AND events.date > ?", 1.hour.from_now, 4.hours.ago)}

  def date
    self.event.occurred_at.strftime("%a, %m/%d/%y")
  end

  # TODO: this should use activerecord enums maybe -ab
  def self.statuses
    {
      nil => "n/a",
      0 => "Absent",
      1 => "Tardy",
      2 => "Present"
    }
  end

  def status_english
    return Attendance.statuses[self.status]
  end

  def calculate_status
    now = Time.now
    event_time = self.event.occurred_at
    if now < event_time
      2
    elsif (now - event_time) < 4.hours
      1
    else
      0
    end
  end
end
