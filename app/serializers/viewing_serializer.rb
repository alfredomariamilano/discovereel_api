class ViewingSerializer < ActiveModel::Serializer
  # has_one :user
  has_one :movie
  attributes :id
  # :watched

  # def title
  #   object.movie.title
  # end
end
