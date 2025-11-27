class User < ApplicationRecord
  # Devise モジュールの指定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
