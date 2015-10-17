class HomeController < ApplicationController
  def index
  end

  def introduce
  end

  def contact
  end

  def admin
    @item = MainSetting.first || MainSetting.new
  end

  def setting
  end
end
