class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  belongs_to :user

index({ title: "text" })
  ## validations ##

  validates :title, presence: true,
                         length: { mimimum: 2, maximum: 25 }



def self.search(search)
   if search
        any_of({title: /#{search}/i}, {body: /#{search}/i})
    end
end

# message: Document(s) not found for class Post with id(s) all, {:conditions=>["name LIKE ?", "%Happy%"]}. summary: When calling Post.find with an id or array of ids, each parameter must match a document in the database or this error will be raised. The search was for the id(s): all, {:conditions=>["name LIKE ?", "%Happy%"]} ... (2 total) and the following ids were not found: all, {:conditions=>["name LIKE ?", "%Happy%"]}. resolution: Search for an id that is in the database or set the Mongoid.raise_not_found_error configuration option to false, which will cause a nil to be returned instead of raising this error when searching for a single id, or only the matched documents when searching for multiples.



end
