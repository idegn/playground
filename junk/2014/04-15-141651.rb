#hoge = (*(+x(/yz))(+u(*vw)))
#hoge = "((x(yz/)+)(u(uw*)+)*)"
hoge = "((1(23/)+)(4(56*)+)*)"

def analyze(str, stack = [])
  # p str, stack
  return stack[0] if str.empty?
  t = str[0]
  rest = str[1..-1]
  if /[0-9]/.match(t)
    stack.push t.to_i
    analyze(rest, stack)
  elsif t == "("
    stack.push " "
    analyze(rest, stack)
  elsif t == ")"
    analyze(rest, stack)
  elsif /[\+|\*|-|\/]/.match(t)
    rstack = Array.new
    rstack.push(stack.pop) while stack[-1] != " "
    tmp = rstack.pop
    eval("tmp #{t}= rstack.pop while !rstack.empty?")
    stack.pop
    stack.push(tmp)
    analyze(rest, stack)
  end
end

p analyze(hoge)
