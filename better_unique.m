function [ new_list ] = better_unique(list)
  list_length = length(list);
  new_list = [];
  it = 1;

  for it = 1:length(list)
    if ~ismember(list(it),new_list)
      new_list = [new_list list(it)];
    end
  end

end
