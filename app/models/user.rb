class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User
end
