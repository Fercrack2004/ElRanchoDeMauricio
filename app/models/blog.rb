class Blog < ApplicationRecord
  # --- ASOCIACIONES CON OTROS MODELOS ---
  has_many :blog_participations, dependent: :destroy
  has_many :users, through: :blog_participations

  accepts_nested_attributes_for :blog_participations

  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank

  has_many :requests, as: :requestable, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  
  # Asociación polimórfica correcta para la sala de chat
  has_one :chat_room, as: :chatable, dependent: :destroy

  # --- ASOCIACIONES DE ARCHIVOS (ACTIVE STORAGE) ---
  has_one_attached :card_image

  # --- CONFIGURACIÓN DE FORMULARIOS ANIDADOS ---
  # Permite manejar participaciones, ingredientes y pasos desde el formulario del blog
  accepts_nested_attributes_for :blog_participations, allow_destroy: true
  accepts_nested_attributes_for :ingredients, 
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['name'].blank? }

  accepts_nested_attributes_for :steps, 
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['description'].blank? }

  # --- VALIDACIONES ---
  validates :title, :public_type, :description, presence: true
  validates :cook_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_blank: true }


  # --- MÉTODOS DE INSTANCIA ---
  
  # Devuelve el usuario que es el autor principal del blog
  def author
    blog_participations.find_by(contribution: :autor)&.user
  end

  # Calcula el promedio de estrellas de todas las reviews asociadas
  def average_rating
    return 0 unless reviews.any?
    reviews.average(:score).round(1)
  end
end