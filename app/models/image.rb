class Image < ApplicationRecord
  has_attached_file :img, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  acts_as_taggable
  belongs_to :category

  def self.search(params)
    if params
      where(category_id: params[:category].to_i)
      where("description LIKE ?", params[:search]) if params[:search].present?
    else
      all
    end
  end

end
