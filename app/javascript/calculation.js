window.addEventListener("DOMContentLoaded", () => {

  const price = document.getElementById("item-price");
  const tax_price = document.getElementById("add-tax-price");
  const profit_price = document.getElementById("profit");
  
  price.addEventListener("input", () => {
    let price_num = document.getElementById("item-price").value;
    let tax_price_num;
    
    tax_price.innerHTML = price_num * 0.1;
    
    tax_price_num = price_num * 0.1;
    profit_price.innerHTML =  (price_num - tax_price_num);
  });
});