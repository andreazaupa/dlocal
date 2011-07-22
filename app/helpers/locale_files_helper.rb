module LocaleFilesHelper

  def hash_to_form(h1,h2,level=0)
    kk=[]
    kk<<h1.keys.first
    html=""
    while h1[kk.first]
    kk << h1[kk.first].keys.first
    
    end
  end
  
  
  def t_row(h1,h2,keys_path)
  html="<tr>"
  html+=t_path(keys_path)
  html+=t_from(h1,keys_path)
  html+=t_to(h2,keys_path)
  html+="</tr>"
  end
  
  def t_from(h,k)
    html="<td>"
      html+="ciao"
    html+="</td>"
  end
  
  def t_to(h,k)
   html="<td>"
    html+=text_area_tag "ciao","ciao"
   html+="</td>"
  end
  
  def t_path(keys_path)
  html="<td>"
  keys.size.times{ html+="&nbsp;" }
  html+=keys.last
  html+="</td>"
  end

  
  
  KeyWords = %w(url)
  
  # Convert a multilevel hash into haml multilevel tree
  # Special KeyWords
  # url : item url
  def hash_to_haml(hash, url = nil)
    haml_tag(:ul) do
      hash.each do |key, value|
        unless KeyWords.include?(key)
          url = get_url(key, value)
          haml_tag(:li) do
            haml_tag(:a, :href => url ) do
              haml_concat(key)
            end
            hash_to_haml(value) if value.is_a?(Hash) && !value.empty?
          end

        end

      end
    end
  end

  private

  def get_url(key, hash)
    # TODO: get full url from hash
    if hash.nil?
      "/#{key}"
    else
      hash.include?("url") ? hash.delete("url") : "/#{key}"
    end
  end
  
  
  
end
