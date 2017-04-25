require 'post'

class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

field :body, type: String
field :commentator, type: String

embedded_in :post, inverse_of: :comments

validates :body, 
  presence: true



# def current_user
#   @current_user ||= User.find session[:user_id] if session[:user_id]
#   if @current_user
#     @current_user
#   else
#     OpenStruct.new(name: 'Guest')
#   end
# end
end