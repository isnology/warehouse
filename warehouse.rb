require 'yaml'

d = YAML.load_file('file.yml')
d['content']['session'] = 2
File.open('file.yml', 'w') { |f| f.write d.to_yaml }

