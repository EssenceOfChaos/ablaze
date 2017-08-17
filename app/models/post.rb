class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

 
  has_mongoid_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://i.imgur.com/GmGtcxB.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
 

 ## model attributes ##
  field :title, type: String
  field :body, type: String
  field :starred, type: Boolean
  field :tags, type: Array, default: []
  field :avatar
  index({ starred: 1 })




  ## associations ##
  belongs_to :user
  embeds_many :comments


  ## validations ##
validates :title, 
   presence: true,
   length: { minimum: 2, maximum: 25 }
   
validates :body, 
  presence: true, 
  length: { maximum: 240 }

  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip }
  end

  def tags_list
    self.tags.join(', ')
  end


# def self.tag_search()
#   if tag_search
#     db.posts.find( { $text: { $search: /#{tag_search} /i} } )
# end
# end

def self.search(search)
   if search
        any_of({title: /#{search}/i}, {body: /#{search}/i}, {tags: /#{search}/i})
  end
end




end
