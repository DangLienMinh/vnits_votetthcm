class News < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('imgpost.jpg')
  validates_attachment_content_type :pic, :content_type => /^image\/(png|gif|jpeg)/
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
  def others
     Article.where(["id <> ?", self.id]).limit(5)
  end

  def short_name
    "#{title.gsub(' ', '-')}"
  end

  scope :top, lambda {
    where(:publish => true).order('updated_at desc').limit(5)
  }

  def short
    sum = self.summary[0..60].capitalize
    sum = sum[0..sum.length - 2] until sum.end_with? " "
    sum + "..."
  end
end
