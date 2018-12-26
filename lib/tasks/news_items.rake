require "news-api"

namespace :news_items do
  desc "Fetch mtv news items"
  task fetch: :environment do
    newsapi = News.new("251255beb8744b148197bf71cc27ffbc")

    tomorrow = (Date.today - 1.day).strftime("%Y-%m-%d")
    today = Date.today.strftime("%Y-%m-%d")

    all_articles = newsapi.get_everything(
      sources: "mtv-news",
      from: tomorrow.to_s,
      to: today.to_s
    )

    all_articles.each do |article|
      MtvItem.create(
        title: article.title,
        description: article.description,
        author: article.author,
        url: article.url,
        url_to_image: article.urlToImage,
        created_at: article.publishedAt
      )
    end

    puts 'Done.'
  end
end
