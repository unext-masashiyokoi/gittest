class HomeController < ApplicationController
  def index
    @users = User.find_by_sql("select * from users where image != '' order by rand()")
    @blogs = Blog.find_by_sql("select * from blogs where (user_id, created_at) in ( select user_id, max(created_at) from blogs where draft_flg = false group by user_id )  order by created_at desc")
    @blogs = Blog.find_by_sql("select id, title, user_id, created_at from blogs where (user_id, created_at) in ( select user_id, max(created_at) from blogs where draft_flg = false group by user_id )  order by created_at desc")
    @blogs = Blog.find_by_sql("(select id, title, user_id, published_at as created_at, 'blog' as content_flg from blogs where (user_id, published_at) in ( select user_id, max(published_at) from blogs where draft_flg = false group by user_id ) ) union all (select id, name as title, user_id, created_at, 'photo' as content_flg from photos where (user_id, created_at) in ( select user_id, max(created_at) from photos group by user_id ))  order by created_at desc")
    @photos = Photo.find_by_sql("select * from photos where image != '' order by rand() limit 9")
 #   json = URI.parse('http://api.e-stat.go.jp/rest/2.0/app/json/getStatsData?appId=0c16c04ca3ae2d5cb4f1897ac85828a7d28ce85a&statsDataId=C0020050213000&cdCat01=%23A03503')
  #  result = Net::HTTP.get(json)
   # @uri = JSON.parse(result)
   # @aaaaaaa = Constants::AAAAAAA
    @events_update = Event.all.order('updated_at desc').where('open_range_id = 1').where("updated_at >= ?", Time.now - 10.days)
  end 


end
