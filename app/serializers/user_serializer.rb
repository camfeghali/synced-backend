class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :followers

  def followers
    self.object.followers
  end
end
