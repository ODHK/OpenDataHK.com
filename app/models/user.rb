class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  				  :facebook, :github, :googleplus, :twitter, :location, :mailinglist, 
            :uid, :provider, :name, :avatar, :blog, :company, :role

  ROLES = %w[banned guest member admin]

  has_many :projects, :through => :project_roles
  has_many :project_roles, :foreign_key => :user_id
  has_many :microbes

  def is_admin?
    self.role == ROLES[3]
  end
  
  def get_facebook_image (user)
    if user.avatar.nil?
      return "http://www.mixcloud.com/media/images/graphics/33_Profile/default_user_300x300-v4.png?v=107"
    end
    if user.avatar.include? "square"
      user.avatar["square"] = "large"
      return user.avatar
    else
      return user.avatar
    end
  end

  def is_member?
    self.role == ROLES[2]
  end

  def is_project_member?(project)
    project.members.include?(self)
  end

  def self.find_for_github_oauth2(auth, signed_in_resource=nil)
    ap auth
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    opts = {
      name:auth.extra.raw_info.name,
      email:auth.info.email,
      github:auth.info.nickname,
      avatar:auth.info.image,
      blog:auth.info.urls.Blog,
      company:auth.extra.raw_info.company,
      location:auth.extra.raw_info.location,
      role:'member'
    }
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        registered_user = fill_in_user_profile(registered_user, opts)
        return registered_user
      else
        opts = {
          password:Devise.friendly_token[0,20],
          provider:auth.provider,
          uid:auth.uid
          }.merge(opts)
        user = User.create(opts)
      end 
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    ap auth
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    opts = {
      name:auth.extra.raw_info.name,
      email:auth.info.email,
      avatar:auth.info.image,
      facebook:auth.info.nickname,
      location:auth.location,
      role:'member'
    }
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        registered_user = fill_in_user_profile(registered_user, opts)
        return registered_user
      else
        opts = {
          password:Devise.friendly_token[0,20],
          provider:auth.provider,
          uid:auth.uid
          }.merge(opts)
        user = User.create(opts)
      end 
    end
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    ap access_token
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    gplus = data.urls.Google if data.urls.present? else nil
    opts = {
      :name => data.name,
      :email => data.email,
      :avatar => data.image,
      :googleplus => gplus,
      :role => 'member'
    }
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        registered_user = fill_in_user_profile(registered_user, opts)
        return registered_user
      else
      opts = {
          provider:access_token.provider,
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20]
          }.merge(opts)
        user = User.create(opts)
        end
     end
  end

  def self.fill_in_user_profile(user, opts={})
    user.name ||= opts[:name]
    user.email ||= opts[:email] 
    user.github ||= opts[:github] 
    user.facebook ||= opts[:facebook] 
    user.googleplus ||= opts[:googleplus] 
    user.twitter ||= opts[:twitter] 
    user.avatar ||= opts[:avatar] 
    user.blog ||= opts[:blog] 
    user.company ||= opts[:company] 
    user.location ||= opts[:location]
    user.save
    return user
  end
end
