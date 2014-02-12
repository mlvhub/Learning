class User
  def initialize username, first_name, last_name
    @username = username
    @first_name = first_name
    @last_name = last_name
    @loggedIn = false
  end

  def authenticate password
    stored_password = findPassword self

    if password == stored_password
      @loggedIn = true
      return true
    end

    false
  end

  def findPassword user
    "secret"
  end

end

user =  User.new "miguel", "Miguel", "Lopez"

if user.authenticate "secret"
  puts "User was authenticated"
else
  puts "Wrong!"
end

