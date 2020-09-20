class PostsController < ApplicationController
  def index 
    @posts = Post.all.order(id: "DESC")
  end

  def create
    post = Post.create(content: params[:content])
    render json:{ post: post}
  end

  def checked
    post = Post.find(params[:id])
    #idを使用して該当するレコードを取得
    if post.checked then
      post.update(checked: false)
      #既読を解除するためにfalseへ変更
    else
      post.update(checked: true)
      #既読にするためtrueへ変更
    end
  

    item = Post.find(params[:id])
    render json: { post: item }
  end
end