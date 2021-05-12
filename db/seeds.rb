eras = ["Renaissance", "Baroque", "Classical", "Romantic", "20th Century", "Contemporary"]

eras.each {|era| Era.create(name: era)}

types = ["Solo", "Chamber", "Concerto"]

types.each {|type| ListType.create(name: type)}