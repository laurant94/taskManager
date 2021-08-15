class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: {minimum: 2, maximum: 255}, format: { with: /\A[a-zA-Z0-9_]{2,20}\z/ }
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i  }

  enum role: {client: 1, admin: 2}

  has_many :tasks
  has_many :labels
  has_secure_password
  has_secure_token :token

  before_destroy :destroy_tasks


  def to_session 
    {id: id}
  end

  def admin?
    role == "admin"
  end

  def fullname
    "#{firstname} #{lastname}"
  end

  private
  def destroy_tasks
    Task.where(user_id: id).delete_all
  end
end
