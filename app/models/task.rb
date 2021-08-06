class Task < ApplicationRecord
  validates :title, length: {minimum:3, maximum:255}
  validates :content, presence: true

  scope :order_by, -> (column, direction) do 
    return if column.nil? 
    direction ||= 'ASC'
    raise "Column value of #{column} not permitted."       unless self.klass.column_names.include?( column.to_s ) 
    raise "Direction value of #{direction} not permitted." unless [ "ASC", "DESC" ].include?( direction.upcase ) 

    order( column => direction)
  end
end
