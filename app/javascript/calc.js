function calc(){
  const item_price = document.getElementById("item-price");
  item_price.addEventListener('input',()=>{
    const input_value = item_price.value;
    const add_tax_price = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    sales_commission = Math.floor(input_value * 0.1)
    sales_profit = input_value - sales_commission
    add_tax_price.innerHTML = sales_commission
    profit.innerHTML = sales_profit
  });
};

window.addEventListener('load', calc);