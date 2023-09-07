require 'securerandom'

class Url < ApplicationRecord
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  before_save :set_shortened_url
  has_many :clicks

  def set_shortened_url
    while true
      self.shortened_url = rand(36**8).to_s(36)
      unless Url.exists? shortened_url: self.shortened_url
        break
      end
    end
  end


end
