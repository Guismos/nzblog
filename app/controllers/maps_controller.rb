class MapsController < ApplicationController

  def map
    @articles = Article.all
    @hash = Gmaps4rails.build_markers(@articles) do |article, marker|
      article_link = view_context.link_to article.title, article_path(article)
      marker.lat article.latitude
      marker.lng article.longitude
      marker.title article.title
      marker.infowindow "<h4>#{article_link}</h4>
                        <small>"+article.created_at.strftime("%F")+"</small><br>
                        <i>#{article.description}</i>"
    end
  end

end
