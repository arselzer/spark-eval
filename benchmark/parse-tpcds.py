cur_sum = 0

last_query = "none"

with open("tpcds.txt") as f:
    for line in f:
        if line.startswith("benchmarking query"):
            if line != last_query:
                last_query = line
                
                print("new query: " + str(line))
                if cur_count > 0:
                    join_sum += cur_sum / cur_count
                    join_count += 1
                    cur_count = 0
                    cur_sum = 0
                    print("join sum:" + str(join_sum))
                    print("join count: " + str(join_count))
                
        p = re.compile(r'applicable query \(joins=\d+\)')
        finds = p.findall(line)
        if len(finds) > 0:
            cur_count += 1
            joins = int(finds[0].split("(joins=")[1].split(")")[0])
            cur_sum += joins
            print(finds)
            print(joins)

join_sum += join_sum / join_count

print("join count: " + str(join_count))
print("join sum: " + str(join_sum))

print("median: " + str(join_sum / join_count))
