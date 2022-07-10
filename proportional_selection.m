%Roll_no 19IM30011
%Name : Kasturi GSagar
function [i] = proportional_selection(value,fitness,pop_size)
avg_fitness = fitness/pop_size;
i = round(value/avg_fitness);
end