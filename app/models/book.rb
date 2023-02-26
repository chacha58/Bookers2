class Book < ApplicationRecord
    
  validates :title, presence: true

  validates :body, presence: true,
                  length: {  maximum: 200 }
                  
       belongs_to :user
    # １対Nの関係性記載
    
end
