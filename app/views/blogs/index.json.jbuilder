json.array!(@blogs) do |blog|
  json.set! :id, blog.id
  json.set! :title, blog.title
  json.set! :start, blog.created_at
  json.url blog_url(blog)
end
