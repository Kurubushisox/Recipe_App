class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, dependent: :destroy
  has_one  :post_image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :post_image, allow_destroy: true, reject_if: proc {|attributes| attributes['image'].blank? }

  validates :name, presence: true, length: {maximum: 30}

  after_initialize do
    build_post_image unless self.persisted? || post_image.present?
  end

  before_save do
    post_image.mark_for_destruction if post_image.image.blank?
  end

end
