class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  searchkick

  validates :first_name, :last_name, :email, presence: true
	
	has_many :locations

  def full_name
  	[first_name, last_name].join(' ')
  end
end
