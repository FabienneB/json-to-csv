require 'csv'
@@resp = []

def file_storing(file_path, hash_ary, field_names)
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  # file_path    = 'users.csv'
  CSV.open(file_path, 'wb', csv_options) do |csv|
    csv << field_names if field_names.size > 0
    hash_ary.each do |hsh|
      csv_content = ary_content(hsh, field_names)
      csv << csv_content
    end
  end
end

# def ary_content(content_hsh, field_ary)
#   cont = []
#   field_ary.map do |ar|
#     if ar.include? '.'
#       ary_key = ar.split(".")
#       cont << content_hsh[ary_key[0]][ary_key[1]][ary_key[2]]
#     else
#       content_hsh[ar].is_a?(Array) ? cont << content_hsh[ar].join(",") : cont << content_hsh[ar]
#     end
#   end
#   p cont
#   cont
# end

def ary_content(content_hsh, field_ary)
  cont = []
  content_hsh.each do |k,v|
    if v.is_a? Array
      cont << v.join(',')
    elsif v.is_a? Hash
      deep_hash(v).each { |val| cont << val }
    else
      cont << v
    end
  end
  cont
end

def deep_hash(hash)
  hash.each do |k1,v1|
    if v1.is_a? Hash
      deep_hash(v1)
    else
      @@resp << v1
      puts "v1"
      puts v1
    end
  end
  @@resp
end


file_storing('users.csv', [{"id"=>0, "email"=>"colleengriffith@quintity.com", "tags"=>["consectetur", "quis"], "profiles"=>{"facebook"=>{"id"=>0, "picture"=>"//fbcdn.com/a2244bc1-b10c-4d91-9ce8-184337c6b898.jpg"}, "twitter"=>{"id"=>0, "picture"=>"//twcdn.com/ad9e8cd3-3133-423e-8bbf-0602e4048c22.jpg"}}}],["id", "email", "tags", "profiles.facebook.id", "profiles.facebook.picture", "profiles.twitter.id", "profiles.twitter.picture"])
