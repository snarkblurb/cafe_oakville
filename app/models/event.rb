class Event < ActiveRecord::Base
	has_many :reservations, :dependent => :destroy
	has_many :users, :through => :reservations

	validates :day, presence: true;
	validates :start, presence: true;
	validates :end, presence: true;
end
