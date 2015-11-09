var a = readline().slice(1,-1).split(",");
var d = [];
var b = function(i) {
if(i==a.length) return; 
d[i] = (c(a[i].slice(0,2),a[i],2,4) || c(a[i].slice(0,3),a[i],3,6) || c(a[i].slice(0,4),a[i],4,8) || c(a[i].slice(0,6),a[i],6,12)) ? 1 : 0
b(i+1);
}
var c = function(w,o,l,r) {
if(l==12) return true;
if(o.slice(l,r)!=w) return false;
return c(w,o,r,r+r-l);
}
b(0);
print(d);