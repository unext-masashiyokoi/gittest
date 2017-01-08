json.array!(@blogs) do |blog|
#  json.extract! blog, :id, :title, :content, :open_range, :created_at
  json.url blog_url(blog)
  json.set! :start, blog.published_at 
  json.set! :title, blog.title
end
