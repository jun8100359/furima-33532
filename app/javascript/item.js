function price (){
  const priceText = document.getElementById("item-price");
  priceText.addEventListener('keyup', () => {
    const inputValue = priceText.value;
    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    fee.innerHTML = Math.floor(inputValue / 10);
    profit.innerHTML = Math.floor(inputValue - fee.innerHTML);
  });
};
window.addEventListener('load',price);