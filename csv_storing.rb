require 'csv'
@@resp = []

def file_storing(file_path, hash_ary, field_names)
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  CSV.open(file_path, 'wb', csv_options) do |csv|
    csv << field_names if field_names.size > 0
    hash_ary.each do |hsh|
      csv_content = ary_content(hsh, field_names)
      csv << csv_content
    end
  end
end

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
    v1.is_a?(Hash) ? deep_hash(v1) : @@resp << v1
  end
  @@resp
end

