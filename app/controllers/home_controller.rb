class HomeController < ApplicationController
  def index
  end
  
  def write
    @title = params[:title]
    @address = params[:address]
    @content = params[:content]
    
    @new_post = Post.new
    @new_post.title = @title
    @new_post.address = @address
    @new_post.content = @content
    @new_post.save
    
    redirect_to "/list"
  end
  
  def list
    @sended_post = Post.all.order("id desc")
    
  end
  
  def delete
    @one_post = Post.find(params[:id])
    @one_post.delete
    redirect_to "/list"
  end
  
  def update_view
    @one_post = Post.find(params[:id])
  end
  
  def update
    @one_post = Post.find(params[:id])
    @one_post.title = params[:title]
    @one_post.address = params[:address]
    @one_post.content = params[:content]
    @one_post.save
    
    redirect_to "/list"
  end

  
end