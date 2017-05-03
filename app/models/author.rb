# == Schema Information
#
# Table name: authors
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :authors, through: :posts

  validates_presence_of :name, on: :update

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Author Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar


  def display_name
    if name.present?
      name
    else
      "Author"
    end
  end

  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

  def change_password(attributes)
    update(password: attributes[:new_password], password_confirmation: attributes[:new_password_confirmation])
  end

  def avatar_image_url
    @author = Author.find(params[:id])
    send_data @author.avatar.url(:thumb), :type => 'image/jpg', :disposition => 'inline'
  end




  private

  def gravtar_hash
    Digest::MD5.hexdigest(email.downcase)
  end


end
