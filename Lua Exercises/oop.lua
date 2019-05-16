Account = { balance = 0 }

function Account:new(obj)
	obj = obj or { }
	self.__index = self
	
	setmetatable(obj, self)
	
	return obj
end

function Account:deposit(value)
	self.balance = self.balance + value
end

function Account:withdraw(value)
	if value > self.balance
	then
		error("Insufficient funds.")
	else
		self.balance = self.balance - value
	end
end

SpecialAccount = Account:new{ }

function SpecialAccount:withdraw(value)
	if value - self.balance >= self:get_limit()
	then
		error("Insufficient funds.")
	else
		self.balance = self.balance - value
	end
end

function SpecialAccount:get_limit()
	return self.limit or 0
end

s = SpecialAccount:new{ balance = 100, limit = 1000.00 }
s:withdraw(1000.00)

print(s.balance)

Stack = { data_ = { }, size_ = 0 }

function Stack:new(obj)
	obj = obj or { }
	self.__index = self
	
	setmetatable(obj, self)
	
	return obj
end

function Stack:push(item)
	self.size_ = self.size_ + 1
	self.data_[self.size_] = item
end

function Stack:pop()
	self.data_[self.size_] = nil
	self.size_ = self.size_ - 1
end

function Stack:top()
	return self.data_[self.size_]
end

function Stack:is_empty()
	return self.size_ == 0
end

function Stack:get_size()
	return self.size_
end

StackQueue = Stack:new{ }

function StackQueue:insert_bottom(item)
	self.size_ = self.size_ + 1
	
	for i = self.size_, 1, -1
	do
		self.data_[i] = self.data_[i - 1]
	end
	
	self.data_[1] = item
end

stack = StackQueue:new{ }

stack:push("a")
stack:push("b")
stack:push("c")
stack:push("d")
stack:push("e")
stack:push("f")

stack:insert_bottom("z")

print(stack:get_size())

while not stack:is_empty()
do
	print(stack:top())
	stack:pop()
end

print(stack:get_size())