class ArticlesController < ApplicationController

  def create
    @article = Article.create(create_params.slice(:title, :content))
    attachable = create_params[:image]
    @article.image.attach(
      io: attachable.tempfile.open,
      filename: attachable.original_filename,
      content_type: attachable.content_type,
      metadata: {
        custom_metadata: {
          article_id: @article.id.to_s
        }
      }
    )
  end

  private

  def create_params
    params.permit(
      :title,
      :content,
      :image
    )
  end
end
