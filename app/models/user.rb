class User < ApplicationRecord
  has_many :concepts
  has_many :sections, through: :concepts
  accepts_nested_attributes_for :concepts, allow_destroy: true

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


  def favorite_section
    favorite_section = ''
    sections_counter = {
      cli: 0,
      rails: 0,
      rails_jquery: 0,
      react_redux: 0,
      sinatra: 0
    }

    self.concepts.all.each do |concept|
      if concept.section_id == 1
        sections_counter[:cli] += 1
      elsif concept.section_id == 2
        sections_counter[:rails_counter] += 1
      elsif concept.section_id == 3
        sections_counter[:rails_jquery_counter] += 1
      elsif concept.section_id = 4
        sections_counter[:react_redux_counter] += 1
      elsif concept.section_id == 5
        sections_counter[:sinatra_counter] += 1
      end
    end

    sections_counter.sort_by!{ |k, v| v }.reverse!.to_h
    favorite_section = sections_counter.keys[0]
  end
end
