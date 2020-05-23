
#Necesario repasar. No entiendo bien el porqué de poner el número en negativo
# @param {Integer} n
# @return {String}
def base_neg2(n)
	if(n==0)
		return "0"
	end
    array=[]
    while(n!=0) do
		array.unshift(n&1)
		n= -(n >> 1)
	end
	return array.join()
end


# @param {Integer} n
# @return {String}
def base_2(n)
	array = []
	while(n!=0) do
		array.unshift(n&1)
		n= n >> 1
	end
	return array.join()
end

#puts base_neg2(2)
n=19
puts n.to_s(2)
puts base_2(n)
puts base_neg2(n)