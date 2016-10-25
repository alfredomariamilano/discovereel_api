class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :watched, :not_watched

  def watched
    # Movie.select(:id, :title).where(:id => object.viewings.where(watched: true))
    object.viewings.where(watched: true).map do |viewing|
      ViewingSerializer.new(viewing, scope: scope, root: false)
    end
  end

  def not_watched
    object.viewings.where(watched: false).map do |viewing|
      ViewingSerializer.new(viewing, scope: scope, root: false)
    end
  end

end
