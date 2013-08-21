require 'net/http'

extend Rails.application.routes.url_helpers

class SitemapPinger
  SEARCH_ENGINES = {
    google: "http://www.google.com/webmasters/tools/ping?sitemap=%s",
    yahoo: "http://search.yahooapis.com/SiteExplorerService/V1/ping?sitemap=%s",
#    ask: "http://submissions.ask.com/ping?sitemap=%s",
    bing: "http://www.bing.com/webmaster/ping.aspx?siteMap=%s"
  }

  def self.ping
    SEARCH_ENGINES.each do |name , url|
      request = url % CGI.escape("http://www.chakamak.ir/sitemap.xml")
      if Rails.env == "production"
        response = Net::HTTP.get_response(URI.parse(request))
      end
    end
  end
end
