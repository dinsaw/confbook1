class User < ActiveRecord::Base
	def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
