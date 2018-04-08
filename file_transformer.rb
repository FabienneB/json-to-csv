require_relative 'json_parsing'
require_relative 'csv_storing'

def json_to_csv_transform(file_path_json, file_path_csv)
  users = file_parsing(file_path_json)
  field_names = field_names_creation(users)
  file_storing(file_path_csv, users, field_names)
end

json_to_csv_transform('users.json', 'users.csv')
