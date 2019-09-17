class User < ApplicationRecord

  def self.getAll
    Rails.cache.fetch("getAll", expires_in: 1.hour){ User.all.to_json }
  end
end
