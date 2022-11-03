class TestController < ApplicationController
  def new
    @wowie = Testmodel.new
  end
end
