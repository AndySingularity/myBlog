class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "35x35" }, :default_url => 'missing_:style.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :article, inverse_of: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


end