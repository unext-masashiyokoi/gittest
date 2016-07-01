class HomeController < ApplicationController
  def index
    @blogs = Blog.find_by_sql("select * from blogs where (user_id, created_at) in ( select user_id, max(created_at) from blogs group by user_id ) order by rand()")
    @photos = Photo.find_by_sql("select * from photos where image != '' order by rand() limit 9")
 #   json = URI.parse('http://api.e-stat.go.jp/rest/2.0/app/json/getStatsData?appId=0c16c04ca3ae2d5cb4f1897ac85828a7d28ce85a&statsDataId=C0020050213000&cdCat01=%23A03503')
  #  result = Net::HTTP.get(json)
   # @uri = JSON.parse(result)
   # @aaaaaaa = Constants::AAAAAAA
  end 


end
