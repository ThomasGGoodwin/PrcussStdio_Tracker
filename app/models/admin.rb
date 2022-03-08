class Admin < ApplicationRecord
  validates :email, presence: true
  validates :full_name, presence: true
  validates :uid, presence: true
  # validates :avatar_url, presence: true

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@tamu.edu || @gmail.com \z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
  
end
