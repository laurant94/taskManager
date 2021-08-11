class Task < ApplicationRecord
  validates :title, length: {minimum:3, maximum:255}
  validates :content, presence: true

  enum priority: {LOW: 0, Medium: 1, HIGH: 2}
  enum status: {"en attente": 0, "en cours": 1, "terminé": 2}

  scope :order_by, -> (column, direction) do 
    return if column.nil? 
    direction ||= 'ASC'
    raise "Column value of #{column} not permitted."       unless self.klass.column_names.include?( column.to_s ) 
    raise "Direction value of #{direction} not permitted." unless [ "ASC", "DESC" ].include?( direction.upcase ) 

    order( column => direction)
  end

  scope :filter_task, ->(title='', status=nil) do 
    if !title.empty? and status.empty?
      return where("title LIKE ?", "%#{title}%")
    elsif !status.empty? and title.empty?
      return where(status: status)
    elsif !status.empty? and !title.empty?
      return where("title LIKE ?", "#{title}").where(status: status)
    end
  end

  paginates_per 20

  private 
  def empty?(val)
    val.nil? or val.blank? or val.to_s.length <= 0
  end
end
