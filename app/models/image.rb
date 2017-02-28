class Image < ApplicationRecord
  has_attached_file :img, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  acts_as_taggable

  def self.search(search)
    if search
      where('images.description LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
