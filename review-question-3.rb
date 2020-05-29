# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'

# A user has many photos. 
class User 
    attr_accessor :name 
    @@all = []
    
    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    #User has many photos 
    def photos
        Photo.all.select {|photo| photo.user == self}
    end 
end 

# A photo has many comments - rather than storing an array of comments, we will get 
# all the comments and select based on the photo attribute. 
# A photo belongs to a user. 
class Photo 
    attr_accessor :user

    @@all = []
    def initialize
        @@all << self 
    end

    def self.all
        @@all
    end

    #Photo has many comments
    def comments 
        Comment.all.select {|comment| comment.photo == self}
    end 

    # We want to make a new comment that is posted on this photo
    def make_comment(message)
        new_comment = Comment.new(message)
        new_comment.photo = self #associate new comment with this photo
    end
end 

# One-has relationship: a comment belongs to a photo 
# A photo has many comments
class Comment 
    @@all = []
    attr_accessor :photo, :message  # a comment belongs to a photo
    
    def initialize(message)
        @message = message
        @@all << self 
    end 

    def self.all
        @@all
    end 
end 

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
