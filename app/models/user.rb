class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
:first_name, :last_name, :profile_name, :avatar
  # attr_accessible :title, :body
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "75x75" }, :default_url => "/images/:style/missing.png"

  
  has_many :albums
  has_many :pictures
  has_many :reviews
  has_many :restrooms
  has_and_belongs_to_many :roles

  letsrate_rater

  def role?(role)
   return !!self.roles.find_by_name(role.to_s)
  end

# before_create :setup_role
#   private
#   def setup_role
#     if self.role_ids.empty?
#       self.role_ids = [2]
#     end
#   end

  def gravatar_url
  	stripped_email = email.strip
  	downcased_email = stripped_email.downcase
  	hash = Digest::MD5.hexdigest(downcased_email)

  	"http://gravatar.com/avatar/#{hash}"
  end

end
