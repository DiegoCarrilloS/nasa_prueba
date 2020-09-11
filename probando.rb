x = {a:1, b:2, c:3}
y = {d:4, e:5, f:6}
z = {g:7, h:8, i:9}

all = {}
all2= {}
all = x.merge(y)
all2 = all.merge(z)

puts all2

all3 = all2.invert
puts all3