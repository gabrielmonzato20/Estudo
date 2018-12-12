let ko = 0;
let one = {
    "lets":function(){ setInterval(function(){ko++;
        console.log(ko);
        if (ko == 2 || ko==1|| ko==3){
            clearInterval(one.lets());
        }  }
        ,500)},
   
};
console.log(one.lets());
if (ko == 22){
    clearInterval(one.lets());
}