# -*- encoding : utf-8 -*-
module ApplicationHelper
  def flag_for(locale)
    image_tag "flags/#{locale}.png", :alt=>locale ,:class=>"flag_small"
  end
  
  
end
