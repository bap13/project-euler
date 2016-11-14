target = 200
ways = 0

for a in target.step(0, -200)
  for b in a.step(0, -100) 
    for c in b.step(0, -50)
      for d in c.step(0, -20)
        for e in d.step(0, -10)
          for f in e.step(0, -5)
            for g in f.step(0, -2)
              ways += 1
            end
          end
        end
      end
    end
  end
end

puts ways
