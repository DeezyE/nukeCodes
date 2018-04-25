class NukesController < ApplicationController

  def index
    seed = (Time.now.strftime("%s").to_i)/3600
    seed = (Time.now.strftime("%s").to_i)/3600 if seed != (Time.now.strftime("%s").to_i)/3600
    srand(seed)
    random = 2.times.map{Random.rand(100000..999999)}

    if current_user.has_role?(:russian)
      @code = "First Code: #{random[0]}, Second Code: #{random[1]}"
    elsif current_user.has_role?(:president)
      @code = "First Code: #{random[0]}"
    elsif current_user.has_role?(:secretary)
      @code = "Second Code: #{random[1]}"
    end
  end



end
