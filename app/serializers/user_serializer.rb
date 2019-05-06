class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :followers, :followees

  def followers
    self.object.followers
  end

  def followees
    self.object.followees
  end

end
