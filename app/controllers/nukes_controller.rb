class NukesController < ApplicationController

  def index
    seed = (Time.now.strftime("%s").to_i)/3600 #this is run every time index is refreshed but will change only every hour. This represents number of seconds since 1970 divided by 3600 to give hourly value`
    srand(seed) #sets that hourly second value as the seed for ruby's internal random number generator
    random = [rand(100000..999999),rand(100000..999999)] # sets random to an array with two 6 digit numbers
    # the following line will also achieve the same result
    # random = 2.times.map{rand(100000..999999)}

    if current_user.has_role?(:russian)
      @code = "First Code: #{random[0]}, Second Code: #{random[1]}"
    elsif current_user.has_role?(:president)
      @code = "First Code: #{random[0]}"
    elsif current_user.has_role?(:secretary)
      @code = "Second Code: #{random[1]}"
    end
  end



end
