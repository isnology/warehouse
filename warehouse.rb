require 'yaml'
require 'green_shoes'

#d = YAML.load_file('file.yml')
#d['content']['session'] = 2
#File.open('file.yml', 'w') { |f| f.write d.to_yaml }

class Id
  @@next = 0

  def self.next
    @@next += 1
  end
end

class Item

  def initialize(description)
    @id = Id.next
    @item_description = description
  end

end

class Location
  attr_accessor :items
  @@id = 0

  def initialize
    @id = Id.next
    @name = @@id += 1
    @items = []
  end

end

class Area
  attr_accessor :areas, :locations

  def initialize(name)
    @id = Id.next
    @name = name
    @areas = []
    @locations = []
  end

end

class Warehouse
  attr_accessor :warehouses, :areas, :locations

  def initialize(name)
    @id = Id.next
    @name = name
    @warehouses = []
    @areas = []
    @locations = []
  end

end



Shoes.app title: "MAIN" do
  para "Welcome to Shoes"
  button "Spawn" do
    Shoes.app title: "Child" do
      para 'hello'
      edit_line
      button('previous') { close }
      button('exit') { exit }
    end
  end
  button('previous') { close }
  button('exit') { exit }
end
