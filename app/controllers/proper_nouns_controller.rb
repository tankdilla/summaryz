class ProperNounsController < ApplicationController
  before_action :set_article

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @proper_noun = @article.proper_nouns.find(params[:id])
    @proper_noun.destroy

    respond_to do |format|
      format.html { redirect_to article_url(@article) }
      format.json { head :no_content }
    end
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
