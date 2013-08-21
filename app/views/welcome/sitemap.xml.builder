xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc "http://www.chakamak.ir"
    xml.priority 1.0
  end
  
  @users.each do |u|
    xml.url do
      xml.loc user_show_url(u)
      xml.lastmod u.updated_at.to_date
      xml.priority 0.5
    end
  end

  @poems.each do |p|
    xml.url do
      xml.loc poem_url(p)
      xml.lastmod p.updated_at.to_date
      xml.priority 0.9
    end
  end

end
