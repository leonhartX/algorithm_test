def magical_string(n)
  s = [1, 2, 2];
  pos = 2;
  current = 1;

  while (s.length < n)
    s[pos].times { s << current }
    current = current ^ 3;
    pos += 1;
  end
  return s[0...n].count 1;
end