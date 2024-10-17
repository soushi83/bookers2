class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    book_comment = book.book_comments.new(book_comment_params)
    book_comment.user_id = current_user.id

    if book_comment.save
      redirect_to book_path(book), notice: 'コメントが投稿されました。'
    else
      redirect_to book_path(book), alert: 'コメントを投稿できませんでした。'
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = book.book_comments.find(params[:id])
    if comment.user == current_user
      comment.destroy
      redirect_to book_path(book), notice: 'Comment was successfully deleted.'
    else
      redirect_to book_path(book), alert: 'You are not authorized to delete this comment.'
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
