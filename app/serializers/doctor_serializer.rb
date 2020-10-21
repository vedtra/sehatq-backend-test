class DoctorSerializer < ActiveModel::Serializer
  has_many :bookings
  attributes :id, :name, :time_start, :time_end
end
