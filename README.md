# json-to-csv
Ruby lib aiming to convert JSON file to a CSV file

file_transformer file has a json_to_csv_transform method which calls :
- file_parsing method from json_parsing.rb file which parse json file
- field_names_creation method from json_parsing.rb file which generate an array of field names (first line of CSV file)
- file_storing method from csv_storing.rb file wich store json file's parsed values into a csv file
