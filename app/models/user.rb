class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  #relation with other models
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	has_many :owned_events, class_name: "Event", inverse_of: :owner
	has_and_belongs_to_many :joined_events, class_name: "Event", inverse_of: :members
	has_and_belongs_to_many :favourite_posts, class_name: "Post", inverse_of: :favourite_users
	has_and_belongs_to_many :friends, class_name: "User", inverse_of: :friend_ofs
	has_and_belongs_to_many :friend_ofs, class_name: "User", inverse_of: :friends
	
  def unfavourite_post(post)
    self.favourite_post_ids.delete(post.id)
    save
  end
end
