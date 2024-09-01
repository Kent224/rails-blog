class Article < ApplicationRecord
    include Visible
  
    has_many :comments, dependent: :destroy
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  
    VALID_STATUSES = ['public', 'private', 'archived']
  
    validates :status, inclusion: { in: VALID_STATUSES }
  
    # ここにクラスメソッドを追加
    def self.public_count
      where(status: 'public').count
    end
  
    def archived?
      status == 'archived'
    end
  end
  