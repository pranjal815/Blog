# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  author_id        :integer
#  published        :boolean          default("f")
#  published_at     :datetime
#

class Post < ApplicationRecord
  make_flagger
  has_many :comments

  acts_as_taggable # Alias for acts_as_taggable_on :tags

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author

  scope :most_recent, -> { order(published_at: :desc)}
  scope :published, -> {where(published: true)}
  scope :recent_pagination, -> (page) {most_recent.paginate(:page => page, :per_page => 9)}
  scope :with_tag, -> (tag) {tagged_with(tag) if tag.present?}

  scope :list_for, -> (page, tag) do
        recent_pagination(page).with_tag(tag)
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def display_day_published
    if published_at.present?
      "Published on #{published_at.strftime('%-b %-d, %Y')}"
    else
      "Not Published Yet!!!"
    end
  end


  def publish
    update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: nil)
  end

  def self.search(search)
    @posts = Post.where(["slug::text like ?","%#{search}%"])
  end

end


