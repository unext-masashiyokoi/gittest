class HomeController < ApplicationController
  def index
    @users = User.find_by_sql("select * from users where image != '' order by rand()")
   # @blogs = Blog.find_by_sql("(select id, title, user_id, published_at as created_at, 'blog' as content_flg from blogs where (user_id, published_at) in ( select user_id, max(published_at) from blogs where draft_flg = false group by user_id ) ) union all (select id, name as title, user_id, created_at, 'photo' as content_flg from photos where (user_id, created_at) in ( select user_id, max(created_at) from photos group by user_id ))  order by created_at desc")
    @blogs = Blog.top_page_blogs
    @events_update = Event.all.order('updated_at desc').where('open_range_id = 1').where("updated_at >= ?", Time.now - 10.days)
  end 


end
