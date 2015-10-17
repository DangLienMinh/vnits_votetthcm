class Upload < ActiveRecord::Base
  belongs_to :subject

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /^image\/(png|gif|jpeg)/

  def img
    image.url(:original)
  end

  def thumb
    image.url(:thumb)
  end

  def avatar
    image.url(:avatar)
  end

  def small
    image.url(:small)
  end
end
