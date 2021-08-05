class Task < ApplicationRecord
  validates :title, length: {minimum:3, maximum:255, message: " :La taille doit être conprise entre 3 et 255 caractères"}
  validates :content, presence: {message: " ne peut pas être vide"}
end
