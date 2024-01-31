
let shopPage=1;
let shoplimit=12;
let shoplist=document.querySelectorAll('.shop-list .shop-item');
function loadItem(){
   let beginGet=shoplimit *(shopPage-1);
   let endGet=shoplimit*shopPage-1;
   shoplist.forEach((item,key)=>{
       if(key >=beginGet && key <= endGet){
           item.style.display= 'block';
       }else{
           item.style.display= 'none';
       }
   });
   listPage();
}
loadItem();
function listPage(){
   let count=Math.ceil(shoplist.length /shoplimit);
   document.querySelector('.listPage').innerHTML='';
   if(shopPage!==1){
       let prev=document.createElement('li');
       prev.innerHTML= 'PREV';
       prev.setAttribute('onclick',"changPage("+(shopPage-1)+")");
       document.querySelector('.listPage').appendChild(prev);
   
   }
   for(i=1;i<=count;i++){
       let newPage=document.createElement('li');
       newPage.innerText=i;
       if(i===shopPage){
           newPage.classList.add('active');
       }
       newPage.setAttribute('onclick',"changPage("+i+")");
       document.querySelector('.listPage').appendChild(newPage);
   }
   if(shopPage!==count){
       let next=document.createElement('li');
       next.innerHTML= 'NEXT';
       next.setAttribute('onclick',"changPage("+(shopPage+1)+")");
       document.querySelector('.listPage').appendChild(next);
   
   }
}
function changPage(i){
   shopPage=i;
   loadItem();
}