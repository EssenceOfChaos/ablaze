class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

## callbacks ##
after_create :first_identity
## associations ##
  has_many :posts
  has_many :identities, :dependent => :destroy
  has_mongoid_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  ## validations ##
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
# FIXME valid email regex doesn't seem to be working!! :( 

  validates :email, presence: true, length: { maximum: 75 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

validates :password, presence: true, if: "id.nil?",
                 length: { minimum: 6 }

validates :username,  presence: true, 
length: { mimimum: 2, maximum: 25 },
format: { with: /\A[a-zA-Z0-9]+\Z/ }



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:linkedin, :twitter, :digitalocean]

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :username, type: String
  field :uid, type: String
  field :provider
 
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time










def self.from_omniauth(auth)
  where(auth.slice(:uid, :provider)).first_or_create do |user|
    user.uid = auth.uid
    user.provider = auth.provider
    user.username = auth.info.name
    user.email = auth.info.email
    user.avatar = auth.info.image
  end
end


def first_identity
  self.identities.first_or_create!(:uid => self.uid, :provider => self.provider, :user_id => self.id)
  Identity.where(:user_id => nil).destroy_all
end



end # end of User Class
