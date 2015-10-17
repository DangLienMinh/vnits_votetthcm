class MainSetting < ActiveRecord::Base
  def slider
    return Upload.where(:id => self.sliders.split(",").select{|item| item != ""}) unless self.sliders.blank?
    []
  end
end
