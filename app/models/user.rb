class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :sc_ownerships, foreign_key: :contributer_id, class_name: "StoryComponent"

  validates :password, exclusion: {in: ["Password"],
    message: "must be changed." }
  validates :name, presence: true
  validates :email, presence: true

end
