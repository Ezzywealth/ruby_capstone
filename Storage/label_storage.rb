require 'json'
require_relative './storage'
require_relative '../Classes/label'

class LabelStorage < Storage
  @labels = []

  class << self
    attr_accessor :labels
  end

  def self.fetch
    labels = if File.exist?('./data/labels.json') && File.size('./data/labels.json').positive?
               JSON.parse(File.read('./data/labels.json'))
             else
               []
             end
    deserialize(labels)
  end

  def self.save(labels)
    labels.each do |label|
      LabelStorage.labels.push(serialize(label))
    end
    File.write('./data/labels.json', JSON.pretty_generate(LabelStorage.labels))
  end

  def self.serialize(label)
    {
      title: label.title,
      id: label.id,
      items: label.items,
      color: label.color
    }
  end

  def self.deserialize(labels)
    temp = []
    labels.each do |label|
      new_label = Label.new(label['id'], label['title'], label['color'])
      temp.push(new_label)
    end
    temp
  end
end
