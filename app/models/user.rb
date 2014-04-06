class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "25x25>" }  
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]    
   
  
  has_many :wods, dependent: :destroy
   
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :avatar, presence: false
  validates :profile_name, presence: true, 
                           uniqueness: true,
            format: {
              with: /\A[a-zA-Z0-9_\-]+\z/,
              message: "must be formatted correctly"
            }
  
end
