const price = () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {  // 要素が存在するか確認
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
      
      const taxAmount = Math.floor(inputValue * 0.1);
      const profitAmount = inputValue - taxAmount;

      addTaxDom.innerHTML = taxAmount;
      profitDom.innerHTML = profitAmount;
    });
  }
};

// Turboがロードされたり、レンダリングされたときにイベントを設定
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);