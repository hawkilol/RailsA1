class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # mudei coisa aqui
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


  has_many :messages
  #validates :name, presence: true
  #validates_uniqueness_of :username
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

         has_many :friends
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		#user.name = auth.info.name
  		user.password = Devise.friendly_token[0, 20]
  		 #user.image = auth.info.image
  	end


  end

end


    

