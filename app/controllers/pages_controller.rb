class PagesController < ApplicationController
  
  def index
    @posts = PostsController.new.main_content
    @events = Event.all
  end
  def about
  end
  def approach
  end
  def mailchimp
  end
  def community
  end

end
