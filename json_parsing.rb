require 'json'
@string_key_beg = []
@string_key_end = []

def file_parsing(file_path)
  serialized_users = File.read(file_path)
  JSON.parse(serialized_users)
end

def field_names_creation(hash_ary)
  field_names = []
  hash_ary.first.each do |k, v|
    if v.is_a? Hash
      @string_key_beg << k
      key_concatenate(v)
      beg_keys = @string_key_beg.map { |sk| "#{@string_key_beg.first}.#{sk}" }
      beg_keys[1..beg_keys.size].each do |bk|
        @string_key_end.uniq.each { |ek| field_names << "#{bk}.#{ek}" }
      end
    else
      field_names << k
    end
  end
  field_names
end

def key_concatenate(hash)
  hash.each do |k1,v1|
    if v1.is_a?(Hash)
      @string_key_beg << k1
      key_concatenate(v1)
    else
      @string_key_end << k1
    end
  end
end
