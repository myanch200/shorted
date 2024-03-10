class Url < ApplicationRecord
  validates :long_url, presence: true, format: URI.regexp(%w[http https])
  validates :url_key, presence: true, uniqueness: true
  before_validation :generate_url_key


  def short_url
    Rails.application.routes.url_helpers.url_url(url_key, host: "localhost:3000")
  end

  # change the param to url_key
  def to_param
    url_key
  end

  private

  def generate_url_key
    self.url_key = SecureRandom.hex(7) unless self.url_key.present?
    rescue ActiveRecord::RecordNotUnique => e
      retry
  end
end
