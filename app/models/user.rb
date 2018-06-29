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

  scope :favorited, -> { where(favorited: true) }
  # def favorite_concepts
  #   self.concepts.where("favorited = true")
  # end


  def favorite_section
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
        sections_counter[:rails] += 1
      elsif concept.section_id == 3
        sections_counter[:rails_jquery] += 1
      elsif concept.section_id = 4
        sections_counter[:react_redux] += 1
      elsif concept.section_id == 5
        sections_counter[:sinatra] += 1
      end
    end

    sections_counter.sort_by{ |k, v| v }.reverse!.to_h
    #SOME UGLY CODE, BUT IT WORKS!

    if sections_counter.keys[0] == :cli
      self.favorite_section = 1
    elsif sections_counter.keys[0] == :rails
      self.favorite_section = 2
    elsif sections_counter.keys[0] == :rails_jquery
      self.favorite_section = 3
    elsif sections_counter.keys[0] == :react_redux
      self.favorite_section = 4
    elsif sections_counter.keys[0] == :sinatra
      self.favorite_section = 5
    end 
  end
end