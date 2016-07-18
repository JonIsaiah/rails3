module ApplicationHelper
  
  #Returns the full title to display based on the specific page
  def full_title(page_title = '')
    base_title = "Jons Damn Tutorial App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
end
