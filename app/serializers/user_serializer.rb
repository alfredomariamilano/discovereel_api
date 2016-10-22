class UserSerializer < ActiveModel::Serializer
  has_many :watcheds
  attributes :id, :username, :first_name, :last_name
end
