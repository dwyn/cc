class User < ApplicationRecord
  has_many :concepts
  has_many :sections, through: :concepts#,source: :sections

  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.info.email != nil 
      #If the email address on a github profile is private,
      #something needs to be provided for validation
        user.email = auth.info.email
      else
        user.email = "blank@gmail.com"
      end
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.save!
    end
  end 
end