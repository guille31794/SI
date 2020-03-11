function z = sorpresa(x)
x = rand(6);
y = find(x > 0.8);
z = x(y);
end