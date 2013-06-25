require './document'

doc = Document.new
doc.read ARGF

puts doc.sorted_counts.collect{|k,v| "#{k}\t#{v}"}
