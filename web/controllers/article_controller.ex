defmodule Reader.ArticleController do
  use Reader.Web, :controller

  def index(conn, _params) do
    json conn, %{
    	"data": [
    		%{
    			"title": "How to wash a pig without getting bitten",
    			"url": "http:/foo.bar.com",
    			"posted_by": "Alexander the Medium",
    			"posted_on": "2017-01-15"
    		}
    	]
    }
  end
end
